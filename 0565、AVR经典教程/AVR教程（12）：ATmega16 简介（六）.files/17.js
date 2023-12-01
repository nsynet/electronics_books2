function ObjectAD() {
  /* Define Variables*/
  this.ADID        = 0;
  this.ADType      = 0;
  this.ADName      = "";
  this.ImgUrl      = "";
  this.ImgWidth    = 0;
  this.ImgHeight   = 0;
  this.FlashWmode  = 0;
  this.LinkUrl     = "";
  this.LinkTarget  = 0;
  this.LinkAlt     = "";
  this.Priority    = 0;
  this.CountView   = 0;
  this.CountClick  = 0;
  this.InstallDir  = "";
  this.ADDIR       = "";
}

function CodeZoneAD(_id) {
  /* Define Common Variables*/
  this.ID          = _id;
  this.ZoneID      = 0;

  /* Define Unique Variables*/

  /* Define Objects */
  this.AllAD       = new Array();
  this.ShowAD      = null;

  /* Define Functions */
  this.AddAD       = CodeZoneAD_AddAD;
  this.GetShowAD   = CodeZoneAD_GetShowAD;
  this.Show        = CodeZoneAD_Show;

}

function CodeZoneAD_AddAD(_AD) {
  this.AllAD[this.AllAD.length] = _AD;
}

function CodeZoneAD_GetShowAD() {
  if (this.ShowType > 1) {
    this.ShowAD = this.AllAD[0];
    return;
  }
  var num = this.AllAD.length;
  var sum = 0;
  for (var i = 0; i < num; i++) {
    sum = sum + this.AllAD[i].Priority;
  }
  if (sum <= 0) {return ;}
  var rndNum = Math.random() * sum;
  i = 0;
  j = 0;
  while (true) {
    j = j + this.AllAD[i].Priority;
    if (j >= rndNum) {break;}
    i++;
  }
  this.ShowAD = this.AllAD[i];
}

function CodeZoneAD_Show() {
  if (!this.AllAD) {
    return;
  } else {
    this.GetShowAD();
  }

  if (this.ShowAD == null) return false;
  document.write(this.ShowAD.ADIntro);
}

var ZoneAD_17 = new CodeZoneAD("ZoneAD_17");
ZoneAD_17.ZoneID      = 17;
ZoneAD_17.ZoneWidth   = 0;
ZoneAD_17.ZoneHeight  = 0;
ZoneAD_17.ShowType    = 1;

var objAD = new ObjectAD();
objAD.ADID           = 16;
objAD.ADType         = 4;
objAD.ADName         = "服务项目联系信息";
objAD.ImgUrl         = "";
objAD.InstallDir     = "/";
objAD.ImgWidth       = 0;
objAD.ImgHeight      = 0;
objAD.FlashWmode     = 0;
objAD.ADIntro        = "<table border=\"0\" width=\"250\" id=\"table1\" cellspacing=\"0\">\n\r	<tr>\n\r		<td width=\"28\" height=\"22\" align=\"center\">\n\r		<img border=\"0\" src=\"http://www.c51.cn/images/c51b1.gif\" width=\"18\" height=\"18\"></td>\n\r		<td height=\"22\"><b>业务①:<a href=\"http://www.c51.cn/shop/index.html\"><font color=\"#0033FF\">单片机学习板/编程器/仿真器</font></a></b></td>\n\r	</tr>\n\r	<tr>\n\r		<td width=\"28\" height=\"22\" align=\"center\">\n\r		<img border=\"0\" src=\"http://www.c51.cn/images/c51b1.gif\" width=\"18\" height=\"18\"></td>\n\r		<td height=\"22\"><b>业务②:<a href=\"http://www.c51.cn/glwz/wzyy/200807/8070.html\"><font color=\"#000080\">工控板销售/PLC改单片机控制</font></a></b></td>\n\r	</tr>\n\r	<tr>\n\r		<td width=\"28\" height=\"22\" align=\"center\">\n\r		<img border=\"0\" src=\"http://www.c51.cn/images/c51b1.gif\" width=\"18\" height=\"18\"></td>\n\r		<td height=\"22\"><b>业务③:<font color=\"#FF00FF\"><a href=\"http://www.c51.cn/glwz/wzyy/200601/1745.html\"><font color=\"#FF00FF\">单片机解密,详情...</font></a></font></b></td>\n\r	</tr>\n\r	<tr>\n\r		<td width=\"28\" height=\"22\" align=\"center\">\n\r		<img border=\"0\" src=\"http://www.c51.cn/images/c51b1.gif\" width=\"18\" height=\"18\"></td>\n\r		<td height=\"22\"><b>业务<font face=\"宋体\">④</font>:</b><a href=\"http://www.c51.cn/glwz/wzyy/200601/1747.html\">电子元器件邮购服务</a></td>\n\r	</tr>\n\r	<tr>\n\r		<td width=\"28\" height=\"22\" align=\"center\">\n\r		<img border=\"0\" src=\"http://www.c51.cn/images/c51b1.gif\" width=\"18\" height=\"18\"></td>\n\r		<td height=\"22\"><b>业务<font face=\"宋体\">⑤</font>:<a href=\"http://www.c51.cn/glwz/wzyy/200601/1749.html\"><font color=\"#00CC00\">PCB设计/抄板/生产</font></a></b></td>\n\r	</tr>\n\r	<tr>\n\r		<td width=\"28\" height=\"22\" align=\"center\">\n\r		<img border=\"0\" src=\"http://www.c51.cn/images/c51b1.gif\" width=\"18\" height=\"18\"></td>\n\r		<td height=\"22\"><b>业务<font face=\"宋体\">⑥</font>:</b><a href=\"http://www.c51.cn/glwz/wzyy/200807/8071.html\">变频节能工程设计/调试/成套</a></td>\n\r	</tr>\n\r	<tr>\n\r		<td width=\"28\" height=\"22\" align=\"center\">\n\r		<img border=\"0\" src=\"http://www.c51.cn/images/c51b1.gif\" width=\"18\" height=\"18\"></td>\n\r		<td height=\"22\"><b>业务<font face=\"宋体\">⑦</font>:</b><a href=\"http://www.c51.cn/glwz/wzyy/200807/8073.html\">恒压供水系统设计/设试/成套</a></td>\n\r	</tr>\n\r	<tr>\n\r		<td width=\"28\" height=\"22\" align=\"center\">\n\r		<img border=\"0\" src=\"http://www.c51.cn/images/c51b1.gif\" width=\"18\" height=\"18\"></td>\n\r		<td height=\"22\"><b>业务<font face=\"宋体\">⑧</font>:</b><a href=\"http://www.c51.cn/glwz/wzyy/200807/8074.html\">自动化工程设计/成套</a></td>\n\r	</tr>\n\r	<tr>\n\r		<td width=\"28\" height=\"22\" align=\"center\">\n\r		<img border=\"0\" src=\"http://www.c51.cn/images/c51b1.gif\" width=\"18\" height=\"18\"></td>\n\r		<td height=\"22\"><b>业务<font face=\"宋体\">⑨</font>:<a href=\"http://www.c51.cn/glwz/wzyy/200508/26.html\"><font color=\"#FF00FF\">广告服务,本站助您发展...</font></a></b></td>\n\r	</tr>\n\r	<tr>\n\r		<td width=\"28\" height=\"22\" align=\"center\">\n\r		<img border=\"0\" src=\"http://www.c51.cn/images/c51b1.gif\" width=\"18\" height=\"18\"></td>\n\r		<td height=\"22\">更多服务请参见官方网站：<a target=\"_blank\" href=\"http://www.c51.cn/\"><font color=\"#0033ff\">Www.c51.Cn</font></a></td>\n\r	</tr>\n\r	<tr>\n\r		<td width=\"28\" height=\"22\" align=\"center\">\n\r		<img border=\"0\" src=\"http://www.c51.cn/images/c51b1.gif\" width=\"18\" height=\"18\"></td>\n\r		<td height=\"22\">业务QQ<b>①</b>:244472974 <IMG alt=点击马上咨询相关业务 src=\"http://wpa.qq.com/pa?p=1:244472974:10\" border=0></td>\n\r	</tr>\n\r	<tr>\n\r		<td width=\"28\" height=\"22\" align=\"center\">\n\r		<img border=\"0\" src=\"http://www.c51.cn/images/c51b1.gif\" width=\"18\" height=\"18\"></td>\n\r		<td height=\"22\">业务QQ<b>②</b>:565042226 <IMG alt=点击马上咨询相关业务 src=\"http://wpa.qq.com/pa?p=1:565042226:10\" border=0></td>\n\r	</tr>\n\r	<tr>\n\r		<td width=\"28\" height=\"22\" align=\"center\">\n\r		<img border=\"0\" src=\"http://www.c51.cn/images/c51b1.gif\" width=\"18\" height=\"18\"></td>\n\r		<td height=\"22\">业务QQ<b>③</b>:341123742 <IMG alt=点击马上咨询相关业务 src=\"http://wpa.qq.com/pa?p=1:341123742:10\" border=0></td>\n\r	</tr>\n\r	<tr>\n\r		<td width=\"28\" height=\"22\" align=\"center\">\n\r		<img border=\"0\" src=\"http://www.c51.cn/images/c51b1.gif\" width=\"18\" height=\"18\"></td>\n\r		<td height=\"22\"><b><font color=\"#FF0000\">24小时业务热线：</font><font color=\"#006699\">0755-27805410</font></b></td>\n\r	</tr>\n\r</table>";
objAD.LinkUrl        = "";
objAD.LinkTarget     = 1;
objAD.LinkAlt        = "";
objAD.Priority       = 1;
objAD.CountView      = 0;
objAD.CountClick     = 0;
objAD.ADDIR          = "AD";
ZoneAD_17.AddAD(objAD);

ZoneAD_17.Show();
