package com.xl.message.controllor;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.xl.message.mqtt.MqttGateway;
import com.xl.message.mqtt.constant.Topics;


@RestController
public class MessageController {

    @Autowired
    MqttGateway mqttGateway;

    @RequestMapping(value="/sendMsg")
    public String sendMsg(@RequestParam String id,@RequestParam String message){

//        mqttGateway.sendToMqtt("defualt-topic:"+message);
        mqttGateway.sendToMqtt(Topics.TOPIC_SERVER_DEVICE_ID.replace("{id}",id), message);
        return "success";
    }
}
