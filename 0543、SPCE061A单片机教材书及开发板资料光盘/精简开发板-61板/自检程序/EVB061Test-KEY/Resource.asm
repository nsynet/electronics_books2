
// Resource Table
// Created by IDE, Do not modify this table

.TEXT
.public _RES_Table;
.external __RES_09_48K_sa
.public _RES_09_48K_SA;
.external __RES_09_48K_ea;
.public _RES_09_48K_EA;
.external __RES_02_48K_sa
.public _RES_02_48K_SA;
.external __RES_02_48K_ea;
.public _RES_02_48K_EA;
.external __RES_03_48K_sa
.public _RES_03_48K_SA;
.external __RES_03_48K_ea;
.public _RES_03_48K_EA;
.external __RES_04_48K_sa
.public _RES_04_48K_SA;
.external __RES_04_48K_ea;
.public _RES_04_48K_EA;
.external __RES_05_48K_sa
.public _RES_05_48K_SA;
.external __RES_05_48K_ea;
.public _RES_05_48K_EA;
.external __RES_06_48K_sa
.public _RES_06_48K_SA;
.external __RES_06_48K_ea;
.public _RES_06_48K_EA;
.external __RES_07_48K_sa
.public _RES_07_48K_SA;
.external __RES_07_48K_ea;
.public _RES_07_48K_EA;
.external __RES_08_48K_sa
.public _RES_08_48K_SA;
.external __RES_08_48K_ea;
.public _RES_08_48K_EA;
.external __RES_01_48K_sa
.public _RES_01_48K_SA;
.external __RES_01_48K_ea;
.public _RES_01_48K_EA;
.external __RES_12_48K_sa
.public _RES_12_48K_SA;
.external __RES_12_48K_ea;
.public _RES_12_48K_EA;
.external __RES_11_48K_sa
.public _RES_11_48K_SA;
.external __RES_11_48K_ea;
.public _RES_11_48K_EA;
.external __RES_10_48K_sa
.public _RES_10_48K_SA;
.external __RES_10_48K_ea;
.public _RES_10_48K_EA;


_RES_Table:

_RES_09_48K_SA:
	.DW offset __RES_09_48K_sa,seg __RES_09_48K_sa;
_RES_09_48K_EA:
	.DW offset __RES_09_48K_ea,seg __RES_09_48K_ea;

_RES_02_48K_SA:
	.DW offset __RES_02_48K_sa,seg __RES_02_48K_sa;
_RES_02_48K_EA:
	.DW offset __RES_02_48K_ea,seg __RES_02_48K_ea;

_RES_03_48K_SA:
	.DW offset __RES_03_48K_sa,seg __RES_03_48K_sa;
_RES_03_48K_EA:
	.DW offset __RES_03_48K_ea,seg __RES_03_48K_ea;

_RES_04_48K_SA:
	.DW offset __RES_04_48K_sa,seg __RES_04_48K_sa;
_RES_04_48K_EA:
	.DW offset __RES_04_48K_ea,seg __RES_04_48K_ea;

_RES_05_48K_SA:
	.DW offset __RES_05_48K_sa,seg __RES_05_48K_sa;
_RES_05_48K_EA:
	.DW offset __RES_05_48K_ea,seg __RES_05_48K_ea;

_RES_06_48K_SA:
	.DW offset __RES_06_48K_sa,seg __RES_06_48K_sa;
_RES_06_48K_EA:
	.DW offset __RES_06_48K_ea,seg __RES_06_48K_ea;

_RES_07_48K_SA:
	.DW offset __RES_07_48K_sa,seg __RES_07_48K_sa;
_RES_07_48K_EA:
	.DW offset __RES_07_48K_ea,seg __RES_07_48K_ea;

_RES_08_48K_SA:
	.DW offset __RES_08_48K_sa,seg __RES_08_48K_sa;
_RES_08_48K_EA:
	.DW offset __RES_08_48K_ea,seg __RES_08_48K_ea;

_RES_01_48K_SA:
	.DW offset __RES_01_48K_sa,seg __RES_01_48K_sa;
_RES_01_48K_EA:
	.DW offset __RES_01_48K_ea,seg __RES_01_48K_ea;

_RES_12_48K_SA:
	.DW offset __RES_12_48K_sa,seg __RES_12_48K_sa;
_RES_12_48K_EA:
	.DW offset __RES_12_48K_ea,seg __RES_12_48K_ea;

_RES_11_48K_SA:
	.DW offset __RES_11_48K_sa,seg __RES_11_48K_sa;
_RES_11_48K_EA:
	.DW offset __RES_11_48K_ea,seg __RES_11_48K_ea;

_RES_10_48K_SA:
	.DW offset __RES_10_48K_sa,seg __RES_10_48K_sa;
_RES_10_48K_EA:
	.DW offset __RES_10_48K_ea,seg __RES_10_48K_ea;


// End Table
.public T_SACM_S480_SpeechTable
T_SACM_S480_SpeechTable:
.dw _RES_01_48K_SA
.dw _RES_02_48K_SA
.dw _RES_03_48K_SA
.dw _RES_04_48K_SA
.dw _RES_05_48K_SA
//.dw _RES_06_48K_SA
//.dw _RES_07_48K_SA
.dw _RES_08_48K_SA
.dw _RES_09_48K_SA
.dw _RES_10_48K_SA
.dw _RES_11_48K_SA
.dw _RES_12_48K_SA
//.public T_SACM_A2000_SpeechTable
//T_SACM_A2000_SpeechTable:
//.dw _RES_CC_24K_SA
