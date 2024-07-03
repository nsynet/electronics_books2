使用KeilC51软件，可以很方便地将代码或者数据绝对定位到某个地址。
1、代码定位：
方法1：使用伪指令CSEG。比如要将MyFunc1定位到代码区C:0x1000，则新建一个A51文件，添加以下内容：
 PUBLIC  MYFUNC1
 CSEG AT 1000H
MYFUNC1:
 ;其它代码
 RET
 在其它源文件中，就可以调用MyFunc()函数了。需要注意的是，编译器不检测传递参数的数目，仅检测函数是否有返回值。
方法2：使用BL51 Locate选项。比如在main.c中定义了一个MyFunc2函数，并且要将该函数定位到代码区C:0x2000，则从菜单
中选择Project->Options for Target 'Target1'，在弹出的对话框中选择BL51 Locate页，在下面的code栏中写上?PR?MYFUNC2?MAIN(0x2000)即可。
如果想定位多个函数，也可以使用*通配符。 
2、变量定位：
只有全局变量可以绝对定位，局部变量无法实现绝对定位。
方法1：使用_at_关键字。声明一个全局变量unsigned char data MyBuf1[8] _at_ 0x20;
方法2：使用BL51 Locate选项。比如将main.c中定义的所有data型的全局变量定位到数据区D:0x28开始的空间，则从菜单中
选择Project->Options for Target 'Target1'，在弹出的对话框中选择BL51 Locate页，在下面的data栏中写上?DT?MAIN(0x28)即可。
如果是idata，则使用?ID?MAIN(0x28)，如果是xdata，则使用?XD?MAIN(0x28)，如果是pdata，则使用?PD?MAIN(0x28)
3、堆栈定位：
在STARTUP.A51文件中定义了堆栈区?STACK，其起始地址同样可以在BL51 Locate页中设置，在Stack栏写上?STACK(0x80)
