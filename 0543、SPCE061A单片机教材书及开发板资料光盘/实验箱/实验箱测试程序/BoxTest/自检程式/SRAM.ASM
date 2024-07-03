//////////////////////////////////////////////////////////////////
// Function: SRAM access function for SACM_DVR Auto Mode
//////////////////////////////////////////////////////////////////
.include hardware.inc

.public _SP_InitWriteSRAM
.public F_SP_InitWriteSRAM 

.CODE
_SP_InitWriteSRAM:         .proc
F_SP_InitWriteSRAM:
		push r1 to [sp]
		
        R1 = 0xFFF0 
        [P_IOA_Dir] = R1        // Port A15- A8: input(FL)/output(OL)
        [P_IOA_Data] = R1       // Port A7 - A4: output(OL)
        R1 = 0xFFF0             // Port A3 - A0: input_PL
        [P_IOA_Attrib] = R1     //

        R1 = 0xFFFF 
        [P_IOB_Dir] = R1        // Port B15- B8: output(buffer)
        [P_IOB_Data] = R1      // 
        [P_IOB_Attrib] = R1     //

        pop r1 from [sp]
        retf 
        .endp


.public F_SP_InitReadSRAM 
.public _SP_InitReadSRAM 

_SP_InitReadSRAM:          .PROC
F_SP_InitReadSRAM:
		push r1 to [sp]
        R1 = 0x00F0 
        [P_IOA_Dir] = R1        // Port A15- A8: input(FL)/output(OL)
        [P_IOA_Data] = R1       // Port A7 - A4: output(OL)
        R1 = 0xFFF0             // Port A3 - A0: input_PL
        [P_IOA_Attrib] = R1     //

        R1 = 0xFFFF 
        [P_IOB_Dir] = R1        // Port B15- B8: output(buffer)
        [P_IOB_Data] = R1      // 
        [P_IOB_Attrib] = R1     //

        pop r1 from [sp]
        retf 
        .ENDP

//////////////////////////////////////////////////////////////////////////////// 
// Function: Write a byte to SRAM on SACM_DVR Auto mode
// Input:   R1: 16 bits Addr[b15..b0]
//          R2: 16 bits Data
// Used: R1,R2,R3
//////////////////////////////////////////////////////////////////////////////// 
.PUBLIC F_SP_WriteSRAM
F_SP_WriteSRAM:
        push r1,r3 to [sp]
        // Save low byte
        [P_IOB_Data] = R1       // set addr.
        R3 = R2                 // save R2 value
        R2 = R2 lsl 4           // shift low 8 bits data to high 8 bits
        R2 = R2 lsl 4           //

        R2 |=0x00A0             // *CS=0, *OE=1, *WE=0 
        [P_IOA_Buffer] = R2     //

        // wait state,
        R2 |=0x0010             // *WE=1,*CS=0 
        [P_IOA_Buffer] = R2     //
        // wait state

        // Save High Byte
        R1 += 1 
        [P_IOB_Data] = R1       // set addr.

        R3 &=0xff00 
        R3 |= 0x00A0 
        [P_IOA_Buffer] = R3     // send data and *CE=0, *WE=0, *OE=1 

        // wait state
        R3 |= 0x0050 
        [P_IOA_Buffer] = R3     // *CE=1, *WE=1, *OE=1  
        pop r1,r3 from [sp]
        retf 

        
//////////////////////////////////////////////////////////////////////////////// 
// Function: Read a byte for SRAM on SACM_DVR Auto mode
// Input:    R1: 16 bits addr.
// Output:   R1: 16 bits Data                        
// Used: R1,R2,R3,R4
////////////////////////////////////////////////////////////////////////////////                 
.PUBLIC F_SP_ReadSRAM
F_SP_ReadSRAM:
        push r2,r4 to [sp]
        [P_IOB_Buffer] = R1     // Set Addr.
        R4 = R1                 // save Addr.
        
        R3 = 0x0090 
        [P_IOA_Buffer] = R3     // *CE=0, *OE=0, *WE=1
        // wait state
        R1 = [P_IOA_Data]       // Get data
        R1 = [P_IOA_Data]       // Get data
        R1 = R1 lsr 4           // Prepare high 8 bits Addr. to low 8 bits
        R2 = R1 lsr 4           // Get low byte data
        
        R3 |= 0x00B0            // *CE=0, *OE=1, *WE=1 
        [P_IOA_Buffer] = R3     //

        R4 += 1         
        [P_IOB_Buffer] = R4     // Set Addr.
        

        R3 = 0x0090 
        [P_IOA_Buffer] = R3     //  *CS=0, *OE=0, *WE=1 

        // wait state
        R1 = [P_IOA_Data]       // Get high byte data
        R1 = [P_IOA_Data]       // Get high byte data
        R1 = R1 & 0xFF00        //
        R1 |= R2                // combine low byte together
        R3 = 0x00f0 
        [P_IOA_Buffer]=R3       // *CS=1, *OE=1, *WE=1 
		pop r2,r4 from [sp]     // don't pop r1(return value)   
        retf 

/////////////////////////////////////////////
// Function: Read SRAM for C language
/////////////////////////////////////////////
.public _SP_ReadSRAM 
_SP_ReadSRAM:              .PROC
        push bp to [sp] 
        bp = sp + 1 
        r1 = [bp+3]                     // SRAM Address
        call	F_SP_ReadSRAM				// R1: return value
        pop bp from [sp] 
        retf 
        .ENDP

/////////////////////////////////////////////
//  Function: Write SRAM for C language                             
/////////////////////////////////////////////
.public _SP_WriteSRAM 
_SP_WriteSRAM: .PROC
        push bp to [sp] 
        bp = sp + 1 
        push r1,r2 to [sp]
        r1 = [bp+3]                                     // Address
        r2 = [bp+4]                                     // Data
        call	F_SP_WriteSRAM
        pop r1,r2 from [sp]
        pop bp from [sp] 
        retf 
        .ENDP

//========================================================================================        
// End of sram.asm
//========================================================================================
        