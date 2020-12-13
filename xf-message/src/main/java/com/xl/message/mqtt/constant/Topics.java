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
	public static final String TOPIC_DEVICE_PREFIX="/AIFC/DEV/";
	public static final String TOPIC_DEVICE_ID=TOPIC_DEVICE_PREFIX+"ID";//上传设备
//	public static final String TOPIC_DEVICE_ID="REG";//上传设备
	public static final String TOPIC_DEVICE_HEART="/HEART";//心跳
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
	
	public static final String TOPIC_DEVICE_FLOORS="/STATUS/GETFLOORS";//请求楼层数据信息
	public static final String TOPIC_DEVICE_GETCOMMUNITYS="/STATUS/GETCOMMUNITY";//小区地图
	
	/**
	 * 服务器到设备
	 */
	public static final String TOPIC_SERVER_PREFIX="/AIFC/SER/";
	public static final String TOPIC_SERVER_ID="{id}";
	public static final String TOPIC_SERVER_DEVICE_HEART=TOPIC_SERVER_PREFIX+TOPIC_SERVER_ID+"/HEART";//心跳
	public static final String TOPIC_SERVER_DEVICE_RESET=TOPIC_SERVER_PREFIX+TOPIC_SERVER_ID+"/RESET";//设备复位
	public static final String TOPIC_SERVER_DEVICE_UPDATE=TOPIC_SERVER_PREFIX+TOPIC_SERVER_ID+"/UPDATE";//设备更新的下载地址
	public static final String TOPIC_SERVER_DEVICE_PHOTO=TOPIC_SERVER_PREFIX+TOPIC_SERVER_ID+"/PHOTO";//设备图片
	public static final String TOPIC_SERVER_DEVICE_ID=TOPIC_SERVER_PREFIX+TOPIC_SERVER_ID+"/ID";//消防设备系统内容
	public static final String TOPIC_SERVER_DEVICE_FLOOR=TOPIC_SERVER_PREFIX+TOPIC_SERVER_ID+"/FLOORS";//楼层信息
	public static final String TOPIC_SERVER_DEVICE_COMMUNITY=TOPIC_SERVER_PREFIX+TOPIC_SERVER_ID+"/COMMUNITY";//小区信息
	public static final String TOPIC_SERVER_DEVICE_COMMUNITYMAP=TOPIC_SERVER_PREFIX+TOPIC_SERVER_ID+"/STATUS/GETCOMMUNITY";//小区地图
}
