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
#include"System.h"

#define uchar unsigned char
#define uint  unsigned int
__CONFIG(0x03c1);
/*****************************************************
函数功能：端口初始化
使用说明：
入口参数：
函数说明；
*****************************************************/
void IO_init()
{
	TRISA=0x03;					//RA0-1设置为输入其余为输出
	ANSEL=0x03;					//ANSEL|0x03将AN0/AN1脚设置为模拟输入，将其余管脚强制为数字口
	ANSELH=0;					//ANSELH&0x00将其余管脚强制为数字口
	PORTA=0;

	TRISB=0x00;					//RB设置为输出
	PORTB=0x00;					//RB输出低电平
	
	TRISC=0xd8;
	PORTC=0x00;
}
/**********************************************************
函数名称；显示扫描
函数功能：
出口参数：
***********************************************************/
void DIS_SCAN()
{
	 
        if(SCAN_NUM==10)
		{	
				WEI1=1;
				WEI2=1;
				WEI3=1;
				WEI4=1;
			    Output(dight[Buff[1]]);
				WEI1=0;
				WEI2=1;
				WEI3=1;
				WEI4=1;
				
		}

		if(SCAN_NUM==20)
		{	
				WEI1=1;
				WEI2=1;
				WEI3=1;
				WEI4=1;
			    Output(dight[Buff[2]]);
				WEI1=1;
				WEI2=0;
				WEI3=1;
				WEI4=1;
				
		}

		if(SCAN_NUM==30)
		{
				WEI1=1;
				WEI2=1;
				WEI3=1;
				WEI4=1;
				Output(dight[Buff[3]]);
				WEI1=1;
				WEI2=1;
				WEI3=0;
				WEI4=1;
			
		}

		if(SCAN_NUM==40)
		{
				WEI1=1;
				WEI2=1;
				WEI3=1;
				WEI4=1;
				Output(dight[Buff[4]]);
				WEI1=1;
				WEI2=1;
				WEI3=1;
				WEI4=0;
				SCAN_NUM=0;
		}
}
/**********************************************************
函数名称；按键扫描
函数功能：
出口参数：
***********************************************************/
void KEY_SCAN()
{
	uchar KEY_DATA;
	KEY_DATA=KEY_PROT&0XD8;					//提取按键总线端口数据

    switch(key_num2)
	{
	  case 0:										 //第一次循环采集按键原始值
			  if(KEY_DATA!=0XD8)				     //第一次循环 判断是否有按键按下
			  {
			     old_key=KEY_DATA;					   //提取按键
			  	 key_num2=1;						   //进入下一次循环
			
			  }
			  else
			  {
			  	 key_num2=0;
			  }
		   
	          break;
	  case 1:											//第二次循环短按键肖抖时基
	          if(KEY_DATA==old_key)						//判断是否为同一按键
			  { 
			  	  key_time++;							//防抖时基++
				  if(key_time>50)						//是否 满足2S 
				  {   
                    
					  key_num2=2;
				      key_time=0;						//防抖时基清零
				  	 
                  }
			  }
			 
		  	  else 										//判断无效按键
			  {
			  		 key_time=0;						//防抖时基清零
				  	 key_num2=0;						//返回到第一次循环
					 KEY_Long=0x00;
					 KEY_Short=0x00;
			  }
		  
	          break;

	   case 2:											//第三次循环判断短按键还是长按键
	          if(KEY_DATA==old_key)						//判断是否为同一按键
			  { 
			  	  key_time++;							//防抖时基++
				  if(key_time>100)						//是否 满足2S 
				  {   
                      KEY_Long=old_key;
				      key_time=0;						//防抖时基清零
				  	  key_num2=0;						//进入下一次循环
                  }
			  }
			 
		  	  else 
			  {
			  		 key_time=0;						//防抖时基清零
				  	 key_num2=0;						//返回到第一次循环
					 KEY_Short=old_key;
			  }
		  
	          break;

      } 

}
/**********************************************************
函数名称；按键标志 置位函数
函数功能：
出口参数：
***********************************************************/
void KEY_SET()
{
	if(KEY_Short!=0x00)
	{
		switch(KEY_Short)
		{
		  case 0xd0:		KEY_MODE=1;			break;
		  case 0xc8:		KEY_STOP_ON=1;		break;
		  case 0x98:		KEY_UP=1;			break;
		  case 0x58:		KEY_DOWN=1; 		break;
			   
		  break;       
		}
		KEY_Short=0x00;
	}

	if(KEY_Long!=0x00)
	{
	    if(KEY_Long==0xc0)
		{
			KEY_MAX_HZ=1;
		}
		KEY_Long==0x00;
	}

}
/**********************************************************
函数名称；主函数
函数功能：
出口参数：
***********************************************************/
void main()
{ 
   IO_init();					//IO初始化
   Timer_init();				//定时器初始化
   EEPROM_INIT();				//EEPROM初始化
   AD_INIT();					//AD初始化
   Output(0xff);				//开机关显示
   
   while(1)
   {
		
		AD_data=get_adc(0);
		KEY_SET();
		
	/*	Buff[1]=AD_data/1000;
		Buff[2]=AD_data%1000/100;
		Buff[3]=AD_data%100/10;
		Buff[4]=AD_data%10;*/

		if(KEY_MODE)
		{
			Buff[1]=Buff[1]+1;
			KEY_MODE=0;
		}
		if(KEY_STOP_ON)
		{
			Buff[1]=0;
			KEY_STOP_ON=0;
		}
		if(KEY_Long)
		{
			Buff[4]=5;
			KEY_Long=0;
		}

		
   }
}
/**********************************************************
函数名称；中断函数
函数功能：
出口参数：
***********************************************************/
void interrupt com1()
{
    if(TMR1IF==1)							//判断中断标志
	{
		TMR1IF=0;							//中断标志位清零
        SCAN_NUM++;							//数码管显示时间扫描变量
        DIS_SCAN();
		KEY_SCAN();
		TMR1L=(65536-100)%256;			    //重新赋初值
		TMR1H=(65536-100)/256;
	}
}