#ifndef _DG_TYPE_
#define _DG_TYPE_

#define CMD_LEN    75   // 命令长度
#define CMD_TAG    1   // 提示符长度


void UartInit();
void UartSendChar(unsigned char ch);
void UartSendStr(unsigned char *pStr);
void UartCharPro(unsigned char ch);
void UartCmdPro();
void UartSendHex(unsigned char x);


#endif
