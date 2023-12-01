
#ifndef AsrItemH
#define AsrItemH

#define MIC_VOL 0x4C
#define SPEAKER_VOL 0x07

#define ITEM_COUNT 8

typedef struct 
{
	uint16 nSoundStart; 
	uint16 nSoundSize; 
}ST_ASR_DATA; 

const ST_ASR_DATA xdata pAsrItem[ITEM_COUNT] =
{
    {0, 3960}, //1-Beijing.mp3 
    {3961, 3744}, //2-Shanghai.mp3 
    {7706, 3888}, //3-Tianjin.mp3 
    {11595, 3816}, //4-ChongQing.mp3 
    {15412, 3600}, //5-GuangZhou.mp3 
    {19013, 3600}, //6-HangZhou.mp3 
    {22614, 3384}, //7-ChengDu.mp3 
    {25999, 3312}, //8-NanJing.mp3 
};

#define STR_00 "bei jing"
#define STR_01 "shang hai"
#define STR_02 "tian jin"
#define STR_03 "chong qing"
#define STR_04 "guang zhou"
#define STR_05 "hang zhou"
#define STR_06 "cheng du"
#define STR_07 "nan jing"
#define STR_08 ""
#define STR_09 ""
#define STR_10 ""
#define STR_11 ""
#define STR_12 ""
#define STR_13 ""
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
