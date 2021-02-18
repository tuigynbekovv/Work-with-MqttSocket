/*
 *  MainViewController.swift
 *  WorkWithMqtt
 *
 *  Created by tuigynbekov on 2/15/21.
 */

import UIKit

class MainViewController: UIViewController {
    // MARK:- Properties
    private var socket = MqttSocket()
    
    
    // MARK:- View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        socketConnect()
        socketClosures()
    }
}


extension MainViewController {
    // MARK:- Socket
    private func socketConnect() {
        socket.connect()
    }
    
    private func socketClosures() {
        socket.socketConnectIs = { bool in
            if bool {
                print("successfully connected, you can subscribe topics!!!")
                self.socket.subscribe(topics: ["/cinema","/anyVideos","/news"])
            }else {
                print("try reconnected!")
            }
        }
    }
}

