/**************************************************************/
 /*文件名：         南通电磁铁控制器方案
  *功能说明：       74HC164驱动数码管  
  *当前PICC版本：   9.83
  *单片机型号：     PIC16F690
  *开发环境：       MPLAB IDE 8.80
  *晶震频率：       4M  外部晶体振荡器
  *功能：     
  *出处：          宁波北仑恒晶电子科技有限公司
  *编写者：        代品川
  /*日期：         2012年11月3日                                  */
/******************************************************************/
#include<pic.h>
#define uchar unsigned char
#define uint  unsigned int

/*****************************************************
函数功能：AD初始化
使用说明：
入口参数：
函数说明；
*****************************************************/
void AD_INIT()
{
	ADCON0=0xc1;					//设置参考电压是用Vref   右对齐方式 使能AD转换
	ADCON1=0x10;					//转换时钟位FOSE/8
}
/*****************************************************
函数功能：AD采集函数
使用说明：
入口参数：
函数说明；
*****************************************************/
uint get_adc(uchar CH)
{
	uint  adc_val;
	CH=CH<<2;							//通道位置设置
	ADCON0=0xc1|CH;						//设置AD通道
	GO = 1;								//启动AD转换
	while(GO);							//等待AD转换完成
	ADIF = 0;							//清零AD转换标志

	adc_val=ADRESH;						//提取AD数据
	adc_val = adc_val<<8|ADRESL;
	return adc_val;						//返回值
}