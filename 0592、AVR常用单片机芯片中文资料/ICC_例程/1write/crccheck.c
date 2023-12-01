/*********************************************
                CRCÐ£Ñé
*********************************************/
unsigned char crccheck(unsigned char *p,unsigned char len)
{
unsigned char bit0,cbit,r,temp,i,j,byte;
temp=0;
for (j=0;j<len;j++)
   {
    byte=p[j];
    for(i=0;i<8;i++)
        {
        cbit=temp&0x01;
        bit0=byte&0x01;
        temp=temp>>1;
        r=cbit^bit0;
        if(r==1)
           temp=temp^0x8c;
        byte=byte>>1;
        }
    }
return temp;	
}