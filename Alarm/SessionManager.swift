//
//  SessionManager.swift
//  Alarm
//
//  Created by Lasha Efremidze on 2/25/17.
//  Copyright © 2017 Lasha Efremidze. All rights reserved.
//

import Foundation
import WatchConnectivity

let SM = SessionManager()

class SessionManager: NSObject {
    
    lazy var session: WCSession = { [unowned self] in
        let session = WCSession.default()
        session.delegate = self
        session.activate()
        return session
    }()
    
    func send(_ message: [String: Any], reply: @escaping ([String: Any]?) -> Void) {
        session.sendMessage(message, replyHandler: { message in
            reply(message)
        }, errorHandler: { error in
            reply(nil)
        })
    }
    
}

extension SessionManager: WCSessionDelegate {
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
    #if os(iOS)
    func sessionDidBecomeInactive(_ session: WCSession) {
        
    }
    
    @available(iOS 9.3, *)
    func sessionDidDeactivate(_ session: WCSession) {
        
    }
    #endif
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any], replyHandler: @escaping ([String : Any]) -> Void) {
        print(message)
        replyHandler(message)
    }
    
}
