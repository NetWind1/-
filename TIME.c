#include<pic.h>
#define uchar unsigned char
#define uint  unsigned int
//void Timer_init();
/**********************************************************
函数名称；定时器初始化
函数功能：
出口参数：
***********************************************************/
void Timer_init()
{
	T1CON=0x21;							//Fosc 1/4分频
	TMR1L=(65536-65000)%256;			    //重新赋初值
	TMR1H=(65536-65534)/256;
	PIE1=0x01;     						//Timer1溢出中断允许 
    GIE=1;      						//开放全局中断
	PEIE=1;     						//使能外部中断
}

