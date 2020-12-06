package com.xl.message.mqtt.service.impl;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import lombok.extern.slf4j.Slf4j;

import com.xl.common.utils.StringUtils;
import com.xl.message.mqtt.service.EquipmentUpload;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class EquipmentUploadFactory {

    //通过Spring将实现EquipmentUpload的实现类都自动注入到strategyMap类中，当用户传入选择的资源池时，自动根据资源池key去对应的资源池实现中查找资源
    @Autowired
    private final Map<String, EquipmentUpload> strategyMap = new ConcurrentHashMap<>();

    public EquipmentUploadFactory(Map<String, EquipmentUpload> strategyMap) {
        this.strategyMap.clear();
        strategyMap.forEach((k, v)-> this.strategyMap.put(k, v));
    }

    public void getResource(String topic,String ieme,String message){       
        
//        log.debug("---topic:"+topic);
        if(StringUtils.isBlank(topic)||topic.equals("#")){
        	return ;
        }
        strategyMap.get(topic).equipment(topic,ieme,message);
    }
}
