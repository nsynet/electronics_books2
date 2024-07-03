#ifndef	__CHAP9_H__
#define	__CHAP9_H__
//write your header here

#define USB_RECIPIENT            (unsigned char)0x1F
#define USB_RECIPIENT_DEVICE     (unsigned char)0x00
#define USB_RECIPIENT_INTERFACE  (unsigned char)0x01
#define USB_RECIPIENT_ENDPOINT   (unsigned char)0x02

//*************************************************************************
// masks
//*************************************************************************
#define USB_CLASS_CODE_TEST_CLASS_DEVICE                    0xdc
#define USB_SUBCLASS_CODE_TEST_CLASS_D12                    0xA0
#define USB_PROTOCOL_CODE_TEST_CLASS_D12                    0xB0


//*************************************************************************
// basic #defines
//*************************************************************************
#define MAX_ENDPOINTS      (unsigned int)0x3
#define EP0_PACKET_SIZE    (unsigned long int)0x0010
#define EP1_PACKET_SIZE    (unsigned long int)0x0004
#define EP2_PACKET_SIZE    (unsigned long int)0x0040
#define USB_IDLE           0
#define USB_TRANSMIT       1
#define USB_RECEIVE        2
//*************************************************************************
// masks
//*************************************************************************
#define USB_REQUEST_TYPE_MASK    (unsigned int)0x60
#define USB_STANDARD_REQUEST     (unsigned int)0x00
#define USB_VENDOR_REQUEST       (unsigned int)0x40
#define USB_REQUEST_MASK         (unsigned int)0x0F
#define DEVICE_ADDRESS_MASK      0x7F
//*************************************************************************
// macros
//*************************************************************************
#define MSB(x)    (((x) >> 16) & 0xFFFF)
#define FALSE   0
#define TRUE    (!FALSE)

//*************************************************************************
// structure and union definitions
//*************************************************************************
typedef union _epp_flags
{
	struct _flags
	{
		unsigned int bus_reset   	: 1;
		unsigned int suspend    	: 1;
		unsigned int setup_packet 	: 1;
		unsigned int remote_wakeup  : 1;
		unsigned int in_isr		  	: 1;
		unsigned int control_state	: 2;
		unsigned int configuration  : 1;
		unsigned int Ep1_ReceiveDataFlag	: 1;
		unsigned int Ep1_SendDataFlag		: 1;
		unsigned int Ep2_ReceiveDataFlag	: 1;
		unsigned int Ep2_SendDataFlag 		: 1;
	}bits;
}EPPFLAGS;
typedef struct _device_request
{
	unsigned int bmRequestType;
	unsigned int bRequest;
	unsigned long int wValue;
	unsigned long int wIndex;
	unsigned long int wLength;
} DEVICE_REQUEST;
#define MAX_CONTROLDATA_SIZE	8
typedef struct _control_transfers
{
	DEVICE_REQUEST DeviceRequest;
	unsigned long int wLength;
	unsigned long int wCount;
	unsigned int * pData;
	unsigned int dataBuffer[MAX_CONTROLDATA_SIZE];
} CONTROL_TRANSFERS;



//*************************************************************************
// basic typedefs for usb1.1
//*************************************************************************
typedef unsigned int   UINT;
typedef unsigned long int  ULINt;
// values for the  returned by the USB GET_STATUS command
#define USB_DEVICE_DESCRIPTOR_TYPE                0x01
#define USB_CONFIGURATION_DESCRIPTOR_TYPE         0x02
#define USB_STRING_DESCRIPTOR_TYPE                0x03
#define USB_INTERFACE_DESCRIPTOR_TYPE             0x04
#define USB_ENDPOINT_DESCRIPTOR_TYPE              0x05
#define USB_POWER_DESCRIPTOR_TYPE                 0x06
// Values for bmAttributes field of an endpoint descriptor
#define USB_ENDPOINT_TYPE_MASK                    0x03
#define USB_ENDPOINT_TYPE_CONTROL                 0x00
#define USB_ENDPOINT_TYPE_ISOCHRONOUS             0x01
#define USB_ENDPOINT_TYPE_BULK                    0x02
#define USB_ENDPOINT_TYPE_INTERRUPT               0x03
#define USB_ENDPOINT_DIRECTION_MASK               0x80
// USB defined request codes
// see chapter 9 of the USB 1.1 specifcation for
// more information.
// These are the correct values based on the USB 1.1
// specification
#define USB_REQUEST_GET_STATUS                    0x00
#define USB_REQUEST_CLEAR_FEATURE                 0x01
#define USB_REQUEST_SET_FEATURE                   0x03
#define USB_REQUEST_SET_ADDRESS                   0x05
#define USB_REQUEST_GET_DESCRIPTOR                0x06
#define USB_REQUEST_SET_DESCRIPTOR                0x07
#define USB_REQUEST_GET_CONFIGURATION             0x08
#define USB_REQUEST_SET_CONFIGURATION             0x09
#define USB_REQUEST_GET_INTERFACE                 0x0A
#define USB_REQUEST_SET_INTERFACE                 0x0B
#define USB_REQUEST_SYNC_FRAME                    0x0C
// defined USB device classes
#define USB_DEVICE_CLASS_RESERVED           0x00
#define USB_DEVICE_CLASS_AUDIO              0x01
#define USB_DEVICE_CLASS_COMMUNICATIONS     0x02
#define USB_DEVICE_CLASS_HUMAN_INTERFACE    0x03
#define USB_DEVICE_CLASS_MONITOR            0x04
#define USB_DEVICE_CLASS_PHYSICAL_INTERFACE 0x05
#define USB_DEVICE_CLASS_POWER              0x06
#define USB_DEVICE_CLASS_PRINTER            0x07
#define USB_DEVICE_CLASS_STORAGE            0x08
#define USB_DEVICE_CLASS_HUB                0x09
#define USB_DEVICE_CLASS_VENDOR_SPECIFIC    0xFF
// USB defined Feature selectors
#define USB_FEATURE_ENDPOINT_STALL          0x0000
#define USB_FEATURE_REMOTE_WAKEUP           0x0001
#define USB_FEATURE_POWER_D0                0x0002
#define USB_FEATURE_POWER_D1                0x0003
#define USB_FEATURE_POWER_D2                0x0004
#define USB_FEATURE_POWER_D3                0x0005
typedef struct _USB_DEVICE_DESCRIPTOR
{
    UINT bLength;
    UINT bDescriptorType;
    ULINt bcdUSB;
    UINT bDeviceClass;
    UINT bDeviceSubClass;
    UINT bDeviceProtocol;
    UINT bMaxPacketSize0;
    ULINt idVendor;
    ULINt idProduct;
    ULINt bcdDevice;
    UINT iManufacturer;
    UINT iProduct;
    UINT iSerialNumber;
    UINT bNumConfigurations;
} USB_DEVICE_DESCRIPTOR, *PUSB_DEVICE_DESCRIPTOR;

typedef struct _USB_ENDPOINT_DESCRIPTOR
{
    UINT bLength;
    UINT bDescriptorType;
    UINT bEndpointAddress;
    UINT bmAttributes;
    ULINt wMaxPacketSize;
    UINT bInterval;
} USB_ENDPOINT_DESCRIPTOR, *PUSB_ENDPOINT_DESCRIPTOR;

// values for bmAttributes Field in USB_CONFIGURATION_DESCRIPTOR
#define BUS_POWERED                           0x80
#define SELF_POWERED                          0x40
#define REMOTE_WAKEUP                         0x20

typedef struct _USB_CONFIGURATION_DESCRIPTOR 
{
    UINT bLength;
    UINT bDescriptorType;
    ULINt wTotalLength;
    UINT bNumInterfaces;
    UINT bConfigurationValue;
    UINT iConfiguration;
    UINT bmAttributes;
    UINT MaxPower;
} USB_CONFIGURATION_DESCRIPTOR, *PUSB_CONFIGURATION_DESCRIPTOR;

typedef struct _USB_INTERFACE_DESCRIPTOR
{
    UINT bLength;
    UINT bDescriptorType;
    UINT bInterfaceNumber;
    UINT bAlternateSetting;
    UINT bNumEndpoints;
    UINT bInterfaceClass;
    UINT bInterfaceSubClass;
    UINT bInterfaceProtocol;
    UINT iInterface;
} USB_INTERFACE_DESCRIPTOR, *PUSB_INTERFACE_DESCRIPTOR;

typedef struct _USB_STRING_DESCRIPTOR 
{
    UINT bLength;
    UINT bDescriptorType;
    UINT bString[1];
} USB_STRING_DESCRIPTOR, *PUSB_STRING_DESCRIPTOR;

// USB power descriptor added to core specification
#define USB_SUPPORT_D0_COMMAND      0x01
#define USB_SUPPORT_D1_COMMAND      0x02
#define USB_SUPPORT_D2_COMMAND      0x04
#define USB_SUPPORT_D3_COMMAND      0x08
#define USB_SUPPORT_D1_WAKEUP       0x10
#define USB_SUPPORT_D2_WAKEUP       0x20

typedef struct _USB_POWER_DESCRIPTOR 
{
    UINT bLength;
    UINT bDescriptorType;
    UINT bCapabilitiesFlags;
    ULINt EventNotification;
    ULINt D1LatencyTime;
    ULINt D2LatencyTime;
    ULINt D3LatencyTime;
    UINT PowerUnit;
    ULINt D0PowerConsumption;
    ULINt D1PowerConsumption;
    ULINt D2PowerConsumption;
} USB_POWER_DESCRIPTOR, *PUSB_POWER_DESCRIPTOR;

typedef struct _USB_COMMON_DESCRIPTOR 
{
    UINT bLength;
    UINT bDescriptorType;
} USB_COMMON_DESCRIPTOR, *PUSB_COMMON_DESCRIPTOR;

// Standard USB HUB definitions 
// See Chapter 11
typedef struct _USB_HUB_DESCRIPTOR {
    UINT        bDescriptorLength;      // Length of this descriptor
    UINT        bDescriptorType;        // Hub configuration type
    UINT        bNumberOfPorts;         // number of ports on this hub
    ULINt       wHubCharacteristics;    // Hub Charateristics
    UINT        bPowerOnToPowerGood;    // port power on till power good in 2ms
    UINT        bHubControlCurrent;     // max current in mA
    UINT        bRemoveAndPowerMask[64];// room for 255 ports power control and removable bitmask
} USB_HUB_DESCRIPTOR, *PUSB_HUB_DESCRIPTOR;

#endif
