#include<pic.h>
#define uchar unsigned char
#define uint  unsigned int
extern void Timer_init();										//��ʱ����ʼ��
extern void AD_INIT();			    							//AD��ʼ��
extern uint get_adc(uchar CH);									//ADת��
extern void w_eeprom(uchar ee_addr,uchar ee_data);				//EEPROMдһ���ֽ���ĳһ����ַ
extern uchar r_eeprom(uchar ee_addr);							//EEPROM ��ĳһ��ַ��ȡһ���ֽ�
extern void EEPROM_INIT();										//EEPROM��ʼ��
extern void Output(uchar i_data);								//74HC164�����������
/*�����λδ����*/
#define  WEI1 RB4						//74HC164���ݹܽ�
#define  WEI2 RC2						//74HC164���ݹܽ�
#define  WEI3 RC1						//74HC164���ݹܽ�
#define  WEI4 RC0						//74HC164���ݹܽ�
/*******************���������������************************/
#define KEY_PROT  PORTC
uchar   KEY_Short;
uchar   KEY_Long;
uchar   key_time;
uchar 	key_num2;
uchar	old_key;

/*******************��ʾ��ر���******************************/

volatile uchar  Buff[5];				//������ʾ������
uchar  dight[]={0xc0,0xf9,0xa4,0xb0,0x99,0x92,0x82,0xf8,0x80,0x90};//����ܱ��� 0-9  -  P  L
uchar SCAN_NUM;
/***************AD����***************/
uint AD_data;
/****************��ʾ��˸���Ʊ���****************/
volatile union
    {
    struct
        {
            volatile unsigned    T0:1;                       
            volatile unsigned    T1:1;                        
            volatile unsigned    T2:1;
            volatile unsigned    T3:1;
            volatile unsigned    T4:1;
            volatile unsigned    T5:1;
            volatile unsigned    T6:1;
            volatile unsigned    T7:1;         
        }oneBit;
        volatile unsigned char allBits;
     }FLAG_ON;                 
#define  KEY_MODE         		FLAG_ON.oneBit.T0					//ģʽ������Ч��־
#define  KEY_STOP_ON     		FLAG_ON.oneBit.T1					//��ͣ������Ч��־
#define  KEY_UP       			FLAG_ON.oneBit.T2					//�ϵ�������Ч��־
#define  KEY_DOWN     			FLAG_ON.oneBit.T3					//�µ�������Ч��־
#define  KEY_MAX_HZ   			FLAG_ON.oneBit.T4					//����˫�����������Ƶ����Ч��־
#define  Blower_Flashing_ON_OFF FLAG_ON.oneBit.T5					//
#define  BL_Timing_ON_OFF       FLAG_ON.oneBit.T6					//
#define  flag_feng         	 	FLAG_ON.oneBit.T7					//

/*****************************************************
�������ܣ���ʱ1ms
(3j+2)*i=(3��33+2)��10=1010(΢��)��������Ϊ��1����
***************************************************/
void delay1ms()
{
   uchar i,j;	
	 for(i=0;i<10;i++)
	  for(j=0;j<33;j++)
	   ;		 
}
/*****************************************************
�������ܣ���ʱ���ɺ���
��ڲ�����n
***************************************************/
void delaynms(uchar n)
{
   uchar i;
	for(i=0;i<n;i++)
	   delay1ms();
}
