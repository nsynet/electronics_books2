//============================================================================//
// 文件名:    usbmain.c
// 描  述：   usb1.1协议的标准请求处理
// 日  期：   2003/04/03
//=============================================================================//
#include "D12CI.H"
#include "chap9.h"

#define NUM_ENDPOINTS	4
#define CONFIG_DESCRIPTOR_LENGTH  (unsigned long int)(sizeof(USB_CONFIGURATION_DESCRIPTOR)+ sizeof(USB_INTERFACE_DESCRIPTOR)+(NUM_ENDPOINTS * sizeof(USB_ENDPOINT_DESCRIPTOR)))

void F_Get_Status(void);
void F_Clear_Feature(void);
void F_Set_Feature(void);
void F_Set_Address(void);
void F_Get_Descriptor(void);
void F_Get_Configuration(void);
void F_Set_Configuration(void);
void F_Get_Interface(void);
void F_Set_Interface(void);
void F_Reserved(void);

void F_Single_Transmit(unsigned int * buf, unsigned int len);
void F_Code_Transmit(unsigned int * pRomData, unsigned long int len);
void F_Stall_Ep0(void);
void F_Control_Handler(void);
void F_Init_Unconfig(void);
void F_Init_Config(void);
void F_Ep0_RxDone_Detail(void);
void F_Ep0_TxDone_Detail(void);

extern unsigned int ep_last;//defined in ExternInt.c
CONTROL_TRANSFERS ControlData;
EPPFLAGS bEPPflags;
//设备描述符号
USB_DEVICE_DESCRIPTOR DeviceDescr =
{
	sizeof(USB_DEVICE_DESCRIPTOR),
    USB_DEVICE_DESCRIPTOR_TYPE,
    0x00010000,
    USB_CLASS_CODE_TEST_CLASS_DEVICE,
    0, 
    0,
	EP0_PACKET_SIZE,
    0x00040071,
    0x00060066,
    0x00010000,
    0, 			//Manufactory
    0,			//Product
    0,			//Serial Number
    25			//Number of possible configurations
};
//配置描述符
USB_CONFIGURATION_DESCRIPTOR ConfigDescr =
{
    sizeof(USB_CONFIGURATION_DESCRIPTOR),
    USB_CONFIGURATION_DESCRIPTOR_TYPE,
    CONFIG_DESCRIPTOR_LENGTH,
	1,
	1,
    0,
	0x60,
	0xf0
};
//接口描述符
USB_INTERFACE_DESCRIPTOR InterfaceDescr =
{
    sizeof(USB_INTERFACE_DESCRIPTOR),
    USB_INTERFACE_DESCRIPTOR_TYPE,
    0,
    0,
	NUM_ENDPOINTS,
	USB_CLASS_CODE_TEST_CLASS_DEVICE,
	USB_SUBCLASS_CODE_TEST_CLASS_D12,
	USB_PROTOCOL_CODE_TEST_CLASS_D12,
	0
};
//端点1输入描述符
USB_ENDPOINT_DESCRIPTOR EP1_TXDescr =
{
	sizeof(USB_ENDPOINT_DESCRIPTOR),
	USB_ENDPOINT_DESCRIPTOR_TYPE,
	0x81,
	USB_ENDPOINT_TYPE_INTERRUPT,
	EP1_PACKET_SIZE,
	10
};
//端点1输出描述符
USB_ENDPOINT_DESCRIPTOR EP1_RXDescr =
{
	sizeof(USB_ENDPOINT_DESCRIPTOR),
	USB_ENDPOINT_DESCRIPTOR_TYPE,
	0x1,
	USB_ENDPOINT_TYPE_INTERRUPT,
	EP1_PACKET_SIZE,
	10
};
//端点2输入描述符
USB_ENDPOINT_DESCRIPTOR EP2_TXDescr =
{
	sizeof(USB_ENDPOINT_DESCRIPTOR),
	USB_ENDPOINT_DESCRIPTOR_TYPE,
	0x82,
	USB_ENDPOINT_TYPE_BULK,
	EP2_PACKET_SIZE,
	10
};
//端点2输出描述符
USB_ENDPOINT_DESCRIPTOR EP2_RXDescr =
{
	sizeof(USB_ENDPOINT_DESCRIPTOR),
	USB_ENDPOINT_DESCRIPTOR_TYPE,
	0x2,
	USB_ENDPOINT_TYPE_BULK,
	EP2_PACKET_SIZE,
	10
};

//*************************************************************************
// USB protocol function pointer arrays
//*************************************************************************
void (*StandardDeviceRequest[])(void) =
{
	F_Get_Status,
	F_Clear_Feature,
	F_Reserved,
	F_Set_Feature,
	F_Reserved,
	F_Set_Address,
	F_Get_Descriptor,
	F_Reserved,
	F_Get_Configuration,
	F_Set_Configuration,
	F_Get_Interface,
	F_Set_Interface,
	F_Reserved,
	F_Reserved,
	F_Reserved,
	F_Reserved
};
void F_Reserved(void)
{
	F_Stall_Ep0();
}
//*************************************************************************
// USB standard device requests
//*************************************************************************
void F_Get_Status(void)
{
	unsigned int endp, txdat[2];
	unsigned int bRecipient = ControlData.DeviceRequest.bmRequestType & USB_RECIPIENT;
	unsigned int c;
	if(bRecipient == USB_RECIPIENT_DEVICE) 
	{
		if(bEPPflags.bits.remote_wakeup == 1)
			txdat[0] = 3;
		else
			txdat[0] = 1;
		txdat[1]=0;
		F_Single_Transmit(txdat, 2);
	} 
	else if(bRecipient == USB_RECIPIENT_INTERFACE)
	{
		txdat[0]=0;
		txdat[1]=0;
		F_Single_Transmit(txdat, 2);
	} 
	else if(bRecipient == USB_RECIPIENT_ENDPOINT) 
	{
		endp = (unsigned int)(ControlData.DeviceRequest.wIndex & MAX_ENDPOINTS);
		if(ControlData.DeviceRequest.wIndex & (unsigned int)USB_ENDPOINT_DIRECTION_MASK)
			c =F_D12_SelectEndpoint(endp*2 + 1);	/* Control-in */
		else
			c = F_D12_SelectEndpoint(endp*2);	/* Control-out */
		if(c & D12_STALL)
			txdat[0] = 1;
		else
			txdat[0] = 0;
		txdat[1] = 0;
		F_Single_Transmit(txdat, 2);
	} 
	else
		F_Stall_Ep0();
}

void F_Clear_Feature(void)
{
	unsigned int endp;
	unsigned int bRecipient = ControlData.DeviceRequest.bmRequestType & USB_RECIPIENT;
	if(bRecipient == USB_RECIPIENT_DEVICE&& ControlData.DeviceRequest.wValue == USB_FEATURE_REMOTE_WAKEUP) 
	{
		bEPPflags.bits.remote_wakeup = 0;
		F_Single_Transmit(0, 0);
	}
	else if(bRecipient == USB_RECIPIENT_ENDPOINT && ControlData.DeviceRequest.wValue == USB_FEATURE_ENDPOINT_STALL)
	{
		endp = (unsigned int)(ControlData.DeviceRequest.wIndex & MAX_ENDPOINTS);
		if(ControlData.DeviceRequest.wIndex & (unsigned int)USB_ENDPOINT_DIRECTION_MASK)
			F_D12_SetEndpointStatus(endp*2 + 1, 0);// clear TX stall for IN on EPn.
		else
			F_D12_SetEndpointStatus(endp*2, 0);// clear RX stall for OUT on EPn. 
		F_Single_Transmit(0, 0);
	} 
	else
		F_Stall_Ep0();
}


void F_Set_Feature(void)
{
	unsigned int endp;
	unsigned int bRecipient = ControlData.DeviceRequest.bmRequestType & USB_RECIPIENT;
	if (bRecipient == USB_RECIPIENT_DEVICE && ControlData.DeviceRequest.wValue == USB_FEATURE_REMOTE_WAKEUP)
	 {
		bEPPflags.bits.remote_wakeup = 1;
		F_Single_Transmit(0, 0);
	}
	else if (bRecipient == USB_RECIPIENT_ENDPOINT && ControlData.DeviceRequest.wValue == USB_FEATURE_ENDPOINT_STALL) 
	{
		endp = (unsigned int)(ControlData.DeviceRequest.wIndex & MAX_ENDPOINTS);
		if (ControlData.DeviceRequest.wIndex & (unsigned int)USB_ENDPOINT_DIRECTION_MASK)
			F_D12_SetEndpointStatus(endp*2 + 1, 1);
		else
			F_D12_SetEndpointStatus(endp*2, 1);
		F_Single_Transmit(0, 0);
	}
	else
		F_Stall_Ep0();
}

void F_Set_Address(void)
{
	F_D12_SetAddressEnable((unsigned int)(ControlData.DeviceRequest.wValue & DEVICE_ADDRESS_MASK), 1);
	F_Single_Transmit(0, 0);
}

void F_Get_Descriptor(void)
{   
	unsigned int bDescriptor = MSB(ControlData.DeviceRequest.wValue);
    if (bDescriptor == USB_DEVICE_DESCRIPTOR_TYPE)  //0x01
	{
		F_Code_Transmit((unsigned int *)&DeviceDescr, sizeof(USB_DEVICE_DESCRIPTOR));
	} 
	else if (bDescriptor == USB_CONFIGURATION_DESCRIPTOR_TYPE)
	{
		F_Code_Transmit((unsigned int *)&ConfigDescr, CONFIG_DESCRIPTOR_LENGTH);
	} 
	else
		F_Stall_Ep0();
}
void F_Get_Configuration(void)
{
	unsigned int c = bEPPflags.bits.configuration;
	F_Single_Transmit(&c, 1);
}
void F_Set_Configuration(void)
{
	if (ControlData.DeviceRequest.wValue == 0)
	{
		//* put device in unconfigured state 
		F_Single_Transmit(0, 0);
		bEPPflags.bits.configuration = 0;
		F_Init_Unconfig();
	} 
	else if (ControlData.DeviceRequest.wValue == 1) 
	{
		// Configure device 
		F_Single_Transmit(0, 0);
		F_Init_Unconfig();
		F_Init_Config();
		bEPPflags.bits.configuration = 1;
	}
	else
		F_Stall_Ep0();
}

void F_Get_Interface(void)
{
	unsigned int txdat = 0;        // Only/Current interface = 0 
	F_Single_Transmit(&txdat, 1);
}
void F_Set_Interface(void)
{
	if (ControlData.DeviceRequest.wValue == 0 && ControlData.DeviceRequest.wIndex == 0)
		F_Single_Transmit(0, 0);
	else
		F_Stall_Ep0();
}



//--------------------------------------------------------------------//
//--------------------------for standard request handle --------------//
//--------------------------------------------------------------------//
void F_Stall_Ep0(void)
{
	F_D12_SetEndpointStatus(0, 1);//
	F_D12_SetEndpointStatus(1, 1);//
}
void F_Single_Transmit(unsigned int * buf, unsigned int len)
{
	if( len <= EP0_PACKET_SIZE) 
	{
		F_D12_WriteEndpoint(1, len, buf);
	}
}
void F_Code_Transmit(unsigned int * pRomData, unsigned long int len)
{
	ControlData.wCount = 0;
	if(ControlData.wLength > len)
		ControlData.wLength = len;
	ControlData.pData = pRomData;
	if( ControlData.wLength >= EP0_PACKET_SIZE) 
	{	
		F_D12_WriteEndpoint(1, EP0_PACKET_SIZE, ControlData.pData);
		ControlData.wCount += EP0_PACKET_SIZE;
		bEPPflags.bits.control_state = USB_TRANSMIT;
	}
	else
    {					
		F_D12_WriteEndpoint(1, ControlData.wLength, pRomData);
		ControlData.wCount += ControlData.wLength;
		bEPPflags.bits.control_state = USB_IDLE;
	}
}

//------------------------------
void F_Control_Handler()
{
	unsigned int type, req;
	type = ControlData.DeviceRequest.bmRequestType & USB_REQUEST_TYPE_MASK;	
	req = ControlData.DeviceRequest.bRequest & USB_REQUEST_MASK;
	if (type == USB_STANDARD_REQUEST)
	{
		(*StandardDeviceRequest[req])();
	}
	else
		F_Stall_Ep0();
}
//-----------------------------------
void F_Init_Unconfig(void)
{
	F_D12_SetEndpointEnable(0);	/* Disable all endpoints but EPP0. */
}
void F_Init_Config(void)
{
	F_D12_SetEndpointEnable(1);	/* Enable  generic/iso endpoints. */
}



//main Ep rxdone

void F_Ep0_RxDone_Detail(void)
{
	unsigned int i;
	unsigned int I_uiBuffer_Data_Length=0;
	if (ep_last & D12_SETUPPACKET)
	{
		ControlData.wLength = 0;
		ControlData.wCount = 0;
		//判断端点是否满,如是,则取出
		I_uiBuffer_Data_Length=F_D12_ReadEndpoint(0, sizeof(ControlData.DeviceRequest),(unsigned int *)(&(ControlData.DeviceRequest)));
		if(I_uiBuffer_Data_Length!= sizeof(DEVICE_REQUEST))
		{
			F_D12_SetEndpointStatus(0, 1);
			F_D12_SetEndpointStatus(1, 1);
			bEPPflags.bits.control_state = USB_IDLE;
			return;
		}
		// Acknowledge setup here to unlock in/out endp
	    // 向控制输出端点发送应答建立命令以重新使能下一个建立阶段
		F_D12_AcknowledgeEndpoint(0);
		F_D12_AcknowledgeEndpoint(1);
		ControlData.wLength = ControlData.DeviceRequest.wLength;
		ControlData.wCount = 0;
		if (ControlData.DeviceRequest.bmRequestType & (unsigned int)USB_ENDPOINT_DIRECTION_MASK) 
		{
			bEPPflags.bits.setup_packet = 1;
			bEPPflags.bits.control_state = USB_IDLE;		/* get command */
		}
		else
		{
			if (ControlData.DeviceRequest.wLength == 0)
			{
				bEPPflags.bits.setup_packet = 1;
				bEPPflags.bits.control_state = USB_IDLE;		/* set command */
			}
			else 
			{
				if(ControlData.DeviceRequest.wLength > MAX_CONTROLDATA_SIZE)
				{
					bEPPflags.bits.control_state = USB_IDLE;
					F_D12_SetEndpointStatus(0, 1);
					F_D12_SetEndpointStatus(1, 1);
				}
				else
				{
					bEPPflags.bits.control_state = USB_RECEIVE;	/* set command with OUT token */
				}
			} // set command with data
		} // else set command
	} // if setup packet

	else if (bEPPflags.bits.control_state == USB_RECEIVE) 
	{
		i =	F_D12_ReadEndpoint(0, EP0_PACKET_SIZE,
			ControlData.dataBuffer + ControlData.wCount);

		ControlData.wCount += i;
		if( i != EP0_PACKET_SIZE || ControlData.wCount >= ControlData.wLength)
		{
			bEPPflags.bits.setup_packet = 1;
			bEPPflags.bits.control_state = USB_IDLE;
		}
	}

	else
	{
		bEPPflags.bits.control_state = USB_IDLE;
	}
}
void F_Ep0_TxDone_Detail(void)
{
	unsigned long int i = ControlData.wLength - ControlData.wCount;
	if (bEPPflags.bits.control_state != USB_TRANSMIT) 
		return;
	if( i >= EP0_PACKET_SIZE)
	{
		F_D12_WriteEndpoint(1, EP0_PACKET_SIZE, ControlData.pData + ControlData.wCount);
		ControlData.wCount += EP0_PACKET_SIZE;
		bEPPflags.bits.control_state = USB_TRANSMIT;
	}
	else if( i != 0)
	{
		F_D12_WriteEndpoint(1, i, ControlData.pData + ControlData.wCount);
		ControlData.wCount += i;
		bEPPflags.bits.control_state = USB_IDLE;
	}
	else if (i == 0)
	{
		F_D12_WriteEndpoint(1, 0, 0); // Send zero packet at the end 
		bEPPflags.bits.control_state = USB_IDLE;
	}
}