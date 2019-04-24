package com.xl.message.mqtt.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;

/**
 * 
* @version:1.0
* @Description: 配置类 
* @author: dingrenxin 
* @date:  2019年4月23日 上午11:13:46
 */
@Setter
@Getter
@Component
public class MqttProperties {	
	@Value("${spring.mqtt.url}")
    private String url;
	@Value("${spring.mqtt.username}")
    private String username;
	@Value("${spring.mqtt.password}")
    private String password;
	@Value("${spring.mqtt.clientId}")
    private String clientId;
	@Value("${spring.mqtt.serverId}")
	private String serverId;
	@Value("${spring.mqtt.topic}")
    private String topic;
	@Value("${spring.mqtt.topics}")
    private String topics;
	@Value("${spring.mqtt.qos}")
    private int qos;
	@Value("${spring.mqtt.timeout}")
    private int timeout;
	@Value("${spring.mqtt.keepalive}")
    private int keepalive;
	
}