//
//  SocketIO.swift
//  probable-node
//
//  Created by m1_air on 8/10/24.
//

import Foundation
import SocketIO
import Observation

enum SocketConfig {
    static let development_url = "http://127.0.0.1:4200"
}

@Observable class SocketService {
    
    var message: String = ""
    static let shared = SocketService()
    private let manager: SocketManager
    let socket: SocketIOClient
    
    private init() {
        let url = URL(string: SocketConfig.development_url)!
        manager = SocketManager(socketURL: url, config: [.log(true), .forceWebsockets(true)])
        socket = manager.defaultSocket
        setupSocketConnection()
    }
    
    private func setupSocketConnection() {
        
        socket.on(clientEvent: .connect) { data, ack in
            self.message = "Socket connected"
        }
        
        socket.connect()
    }
    
    deinit {
            socket.disconnect()
        }
}
