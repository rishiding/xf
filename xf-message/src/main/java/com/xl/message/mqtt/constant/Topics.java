package com.xl.message.mqtt.constant;
/**
 * 
* @version:1.0
* @Description: 主题定义
* @author: dingrenxin 
* @date:  2019年4月24日 下午2:40:39
 */
public class Topics {
	/**
	 * 设备到服务器
	 */
	public static final String TOPIC_DEVICE_ID="/AIFC/DEV/ID";//上传设备
	public static final String TOPIC_DEVICE_SS_CONTENT="/AIFC/DEV/IEME/STATUS/EVS";//疏散系统内容
	public static final String TOPIC_DEVICE_XF_CONTENT="/AIFC/DEV/IEME/STATUS/FCS";//消防系统内容
	public static final String TOPIC_DEVICE_JK_CONTENT="/AIFC/DEV/IEME/STATUS/MOS";//监控系统内容
	public static final String TOPIC_DEVICE_XFSB_CONTENT="/AIFC/DEV/IEME/STATUS/FCD";//消防设备系统内容
	public static final String TOPIC_DEVICE_KQ_CONTENT="/AIFC/DEV/IEME/STATUS/ATT";//考勤内容
	public static final String TOPIC_DEVICE_BJ_PHOTO="/AIFC/DEV/IEME/PHOTO/ALARM";//报警图片内容
	public static final String TOPIC_DEVICE_KQ_PHOTO="/AIFC/DEV/IEME/PHOTO/ATTEN";//考勤图片内容
	
	/**
	 * 服务器到设备
	 */
	
	public static final String TOPIC_SERVER_DEVICE_RESET="/AIFC/SER/IEME/RESET";//设备复位
	public static final String TOPIC_SERVER_DEVICE_UPDATE="/AIFC/SER/IEME/UPDATE";//设备更新的下载地址
	public static final String TOPIC_SERVER_DEVICE_PHOTO="/AIFC/SER/IEME/PHOTO";//设备图片
	public static final String TOPIC_SERVER_DEVICE_ID="/AIFC/SER/IEME/ID";//消防设备系统内容
	
}
