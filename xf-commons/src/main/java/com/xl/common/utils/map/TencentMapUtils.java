package com.xl.common.map;
/**
 * 腾讯地图工具类
 * @author rishi
 *
 */
public class TencentMapUtils {
	private static final String ADRESS_URL="http://apis.map.qq.com/ws/geocoder/v1/?address=";  //地址转换接口
	private static final String TRANSLATE_URL="http://apis.map.qq.com/ws/coord/v1/translate";  //坐标转换接口
	private static final String IP_URL="http://apis.map.qq.com/ws/location/v1/ip";//ip 定位
	private static final String DRIVING_URL="http://apis.map.qq.com/ws/direction/v1/driving/";//路线规划地址
	private static final String KEY="TXFBZ-OD6KD-PFL4C-HIWU4-45PV2-NAFKX";
	private static final String OUTPUT="json";
	
	/**
	 * IP定位方法
	 * @param ip
	 */
	public static void ipLocation(String ip){
		String url=IP_URL+"?ip="+ip+"&key="+KEY;
		
	}
	
}
