package com.xl.message.mqtt.constant;
/**
 * 
* @version:1.0
* @Description: 主题定义
* @author: dingrenxin 
* @date:  2019年4月24日 下午2:40:39
 */
public class Topics {
	public static final String DEVICE_ONLINE="0";
	public static final String DEVICE_OFFLINE="1";
	
	public static final String DEVICE_TYPE_SS="1";//疏散系统
	public static final String DEVICE_TYPE_XF="2";//消防系统
	public static final String DEVICE_TYPE_JK="3";//监控系统
	
	public static final String DEVICE_ALARM_A="1";//报警
	public static final String DEVICE_ALARM_F="2";//故障
	
	
	/**
	 * 设备到服务器
	 */
	public static final String TOPIC_DEVICE_PREFIX="AIFC/DEV/";
	public static final String TOPIC_DEVICE_ID=TOPIC_DEVICE_PREFIX+"ID";//上传设备
	public static final String TOPIC_DEVICE_SS_ALARM="/STATUS/EVS/ALARM";//疏散报警	
	public static final String TOPIC_DEVICE_SS_OPERATION="/STATUS/EVS/OPERATION";//疏散年月检
	
	public static final String TOPIC_DEVICE_XF_ALARM="/STATUS/FCS/ALARM";//消防系统内容
	public static final String TOPIC_DEVICE_XF_OPERATION="/STATUS/FCS/OPERATION";//消防系统年月检
	
	public static final String TOPIC_DEVICE_JK_ALARM="/STATUS/MOS/ALARM";//监控系统内容
	public static final String TOPIC_DEVICE_JK_OPERATION="/STATUS/MOS/OPERATION";//监控系统内容
	
	public static final String TOPIC_DEVICE_XFSB_CONTENT="/STATUS/FCD";//消防设备系统内容
	public static final String TOPIC_DEVICE_KQ_CONTENT="/STATUS/ATT";//考勤内容
	public static final String TOPIC_DEVICE_BJ_PHOTO="/PHOTO/ALARM";//报警图片内容
	public static final String TOPIC_DEVICE_KQ_PHOTO="/PHOTO/ATTEN";//考勤图片内容
	
	/**
	 * 服务器到设备
	 */
	
	public static final String TOPIC_SERVER_DEVICE_RESET="AIFC/SER/IEME/RESET";//设备复位
	public static final String TOPIC_SERVER_DEVICE_UPDATE="AIFC/SER/IEME/UPDATE";//设备更新的下载地址
	public static final String TOPIC_SERVER_DEVICE_PHOTO="AIFC/SER/IEME/PHOTO";//设备图片
	public static final String TOPIC_SERVER_DEVICE_ID="AIFC/SER/IEME/ID";//消防设备系统内容
	
}
