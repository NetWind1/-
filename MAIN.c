/**************************************************************/
 /*�ļ�����         ��ͨ���������������
  *����˵����       74HC164���������  
  *��ǰPICC�汾��   9.83
  *��Ƭ���ͺţ�     PIC16F690
  *����������       MPLAB IDE 8.80
  *����Ƶ�ʣ�       4M  �ⲿ��������
  *���ܣ�     
  *������          �������غ㾧���ӿƼ����޹�˾
  *��д�ߣ�        ��Ʒ��
  /*���ڣ�         2012��11��3��                                  */
/******************************************************************/
#include<pic.h>
#include"System.h"

#define uchar unsigned char
#define uint  unsigned int
__CONFIG(0x03c1);
/*****************************************************
�������ܣ��˿ڳ�ʼ��
ʹ��˵����
��ڲ�����
����˵����
*****************************************************/
void IO_init()
{
	TRISA=0x03;					//RA0-1����Ϊ��������Ϊ���
	ANSEL=0x03;					//ANSEL|0x03��AN0/AN1������Ϊģ�����룬������ܽ�ǿ��Ϊ���ֿ�
	ANSELH=0;					//ANSELH&0x00������ܽ�ǿ��Ϊ���ֿ�
	PORTA=0;

	TRISB=0x00;					//RB����Ϊ���
	PORTB=0x00;					//RB����͵�ƽ
	
	TRISC=0xd8;
	PORTC=0x00;
}
/**********************************************************
�������ƣ���ʾɨ��
�������ܣ�
���ڲ�����
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
�������ƣ�����ɨ��
�������ܣ�
���ڲ�����
***********************************************************/
void KEY_SCAN()
{
	uchar KEY_DATA;
	KEY_DATA=KEY_PROT&0XD8;					//��ȡ�������߶˿�����

    switch(key_num2)
	{
	  case 0:										 //��һ��ѭ���ɼ�����ԭʼֵ
			  if(KEY_DATA!=0XD8)				     //��һ��ѭ�� �ж��Ƿ��а�������
			  {
			     old_key=KEY_DATA;					   //��ȡ����
			  	 key_num2=1;						   //������һ��ѭ��
			
			  }
			  else
			  {
			  	 key_num2=0;
			  }
		   
	          break;
	  case 1:											//�ڶ���ѭ���̰���Ф��ʱ��
	          if(KEY_DATA==old_key)						//�ж��Ƿ�Ϊͬһ����
			  { 
			  	  key_time++;							//����ʱ��++
				  if(key_time>50)						//�Ƿ� ����2S 
				  {   
                    
					  key_num2=2;
				      key_time=0;						//����ʱ������
				  	 
                  }
			  }
			 
		  	  else 										//�ж���Ч����
			  {
			  		 key_time=0;						//����ʱ������
				  	 key_num2=0;						//���ص���һ��ѭ��
					 KEY_Long=0x00;
					 KEY_Short=0x00;
			  }
		  
	          break;

	   case 2:											//������ѭ���ж϶̰������ǳ�����
	          if(KEY_DATA==old_key)						//�ж��Ƿ�Ϊͬһ����
			  { 
			  	  key_time++;							//����ʱ��++
				  if(key_time>100)						//�Ƿ� ����2S 
				  {   
                      KEY_Long=old_key;
				      key_time=0;						//����ʱ������
				  	  key_num2=0;						//������һ��ѭ��
                  }
			  }
			 
		  	  else 
			  {
			  		 key_time=0;						//����ʱ������
				  	 key_num2=0;						//���ص���һ��ѭ��
					 KEY_Short=old_key;
			  }
		  
	          break;

      } 

}
/**********************************************************
�������ƣ�������־ ��λ����
�������ܣ�
���ڲ�����
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
�������ƣ�������
�������ܣ�
���ڲ�����
***********************************************************/
void main()
{ 
   IO_init();					//IO��ʼ��
   Timer_init();				//��ʱ����ʼ��
   EEPROM_INIT();				//EEPROM��ʼ��
   AD_INIT();					//AD��ʼ��
   Output(0xff);				//��������ʾ
   
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
�������ƣ��жϺ���
�������ܣ�
���ڲ�����
***********************************************************/
void interrupt com1()
{
    if(TMR1IF==1)							//�ж��жϱ�־
	{
		TMR1IF=0;							//�жϱ�־λ����
        SCAN_NUM++;							//�������ʾʱ��ɨ�����
        DIS_SCAN();
		KEY_SCAN();
		TMR1L=(65536-100)%256;			    //���¸���ֵ
		TMR1H=(65536-100)/256;
	}
}