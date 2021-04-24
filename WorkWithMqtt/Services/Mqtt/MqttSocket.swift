/*
 *  MqttSocket.swift
 *  WorkWithMqtt
 *
 *  Created by tuigynbekov on 2/15/21.
 */

import UIKit
import MQTTClient

class MqttSocket: NSObject {
    
    // MARK:- Properties
    let session = MQTTSession()!
    
    var socketConnectIs: ((Bool) -> ())?
    
    
    // MARK:- Main functions
    func connect() {
        let url = URL.init(string: "wss://") //link mqtt port
        let transport = MQTTWebsocketTransport()
        
        transport.url = url
        session.transport = transport
        session.userName = "tuigynbekov"
        session.password = "tuigynbekov"
        session.clientId = String.init(format: "mqtt-iOS-%04d", Int.random(in: 1..<9999999999))
        session.delegate = self
        session.cleanSessionFlag = true
        session.connect()
    }
    
    func disconnect() -> Void {
        session.disconnect()
    }
    
    func subscribe(topics: [String]) -> Void {
        for topic in topics {
            session.subscribe(toTopic: topic, at: .atMostOnce)
        }
    }
    
    func publish(data: Data, topic: String) -> Void {
        self.session.publishData(data, onTopic: topic, retain: false, qos: .atLeastOnce)
    }
}


extension MqttSocket: MQTTSessionDelegate {
    // MARK:- MQTTSession protocols
    func handleEvent(_ session: MQTTSession!, event eventCode: MQTTSessionEvent, error: Error!) {
        eventCode == .connected ? socketConnectIs?(true) : socketConnectIs?(false)
        print("Socket connect status is:", eventCode == .connected)
    }
    
    func newMessage(_ session: MQTTSession!, data: Data!, onTopic topic: String!, qos: MQTTQosLevel, retained: Bool, mid: UInt32) {
//        if topic == "jms/topic/" {
//            let object = try! ApiReply(serializedData: data!)
//        }
    }
}
