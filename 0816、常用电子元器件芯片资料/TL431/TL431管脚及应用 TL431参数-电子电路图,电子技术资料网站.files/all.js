if( PageClass ==null)
{
	var PageClass = 0;
}
if(PageClass==0)
{
//--信息页广告--图片预览300*300
var temp;
temp="<iframe src='/show/300.htm' width=250 height=250 frameborder=no border=0 MARGINWIDTH=0 MARGINHEIGHT=0 SCROLLING=no></iframe>";
set_innerHTML('soft_300',temp);



//--信息页广告--下载介绍位置上方
var temp;
temp="<iframe src='/show/gg_368.htm' width=336 height=280 frameborder=no border=0 MARGINWIDTH=0 MARGINHEIGHT=0 SCROLLING=no></iframe>";
set_innerHTML('soft_01',temp);

//--信息页广告--下载页左栏上方
var temp;
temp="<iframe src='/show/gg_468.htm' width=468 height=60 frameborder=no border=0 MARGINWIDTH=0 MARGINHEIGHT=0 SCROLLING=no></iframe>";
set_innerHTML('soft_03',temp);


//--信息页广告--下载页左栏上方
//var temp;//
//temp="<iframe marginwidth=0 marginheight=0  frameborder=0 bordercolor='#ff0000' width=468 height=60 scrolling=no src='http://www.jfsky.com/show/soft03.htm'></iframe><br>";
//set_innerHTML('soft_02',temp);

//--信息页广告--下载页栏目导航通栏
var temp;
temp="<iframe marginwidth=0 marginheight=0  frameborder=0 bordercolor='#ff0000' width=760 height=62 scrolling=no src='/show/top.htm'></iframe>";
set_innerHTML('soft_head',temp);}


if(PageClass==1)
{}
if(PageClass==2)
{}
