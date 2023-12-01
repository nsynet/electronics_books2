
#ifndef AsrItemH
#define AsrItemH

#define MIC_VOL 0x4C
#define SPEAKER_VOL 0x07

#define ITEM_COUNT 14	//定义识别语音个数
#define VOIC_COUNT 9	//定义播放语音个数

typedef struct 
{
	uint32 nSoundStart; //开始地址
	uint32 nSoundSize; 	//语音大小
}ST_ASR_DATA; 

const ST_ASR_DATA xdata	pAsrItem[VOIC_COUNT]  =
{
    {0, 3960}, //1-Beijing.mp3 3960
    {3961, 3744}, //2-Shanghai.mp3 
    {7706, 3888}, //3-Tianjin.mp3 
    {11595, 3816}, //4-ChongQing.mp3 
    {15412, 3600}, //5-GuangZhou.mp3 
    {19013, 3600}, //6-HangZhou.mp3 
    {22614, 3384}, //7-ChengDu.mp3 
    {25999, 3312}, //8-NanJing.mp3
	{29312, 1235}, //9-verygood.mp3

};
//======识别结果有语音播放============
#define STR_00 "bei jing"
#define STR_01 "shang hai"
#define STR_02 "tian jing"
#define STR_03 "chong qing"
#define STR_04 "guang zhou"
#define STR_05 "hang zhou"
#define STR_06 "cheng du"
#define STR_07 "nan jing"

#define STR_08 "ni hao"

//=======识别结果无语音播放============
#define STR_09 "guan deng"
#define STR_10 "tai deng kai"
#define STR_11 "tai deng guan"
#define STR_12 "chuang lian kai"
#define STR_13 "chuang lian guan"
//=======更多识别语音请在下面自行添加，并修改相应代码========
#define STR_14 ""
#define STR_15 ""
#define STR_16 ""
#define STR_17 ""
#define STR_18 ""
#define STR_19 ""
#define STR_20 ""
#define STR_21 ""
#define STR_22 ""
#define STR_23 ""
#define STR_24 ""
#define STR_25 ""
#define STR_26 ""
#define STR_27 ""
#define STR_28 ""
#define STR_29 ""
#define STR_30 ""
#define STR_31 ""
#define STR_32 ""
#define STR_33 ""
#define STR_34 ""
#define STR_35 ""
#define STR_36 ""
#define STR_37 ""
#define STR_38 ""
#define STR_39 ""
#define STR_40 ""
#define STR_41 ""
#define STR_42 ""
#define STR_43 ""
#define STR_44 ""
#define STR_45 ""
#define STR_46 ""
#define STR_47 ""
#define STR_48 ""
#define STR_49 ""

#endif
