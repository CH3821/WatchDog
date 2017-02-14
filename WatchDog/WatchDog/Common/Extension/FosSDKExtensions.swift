//
//  FosSDKExtensions.swift
//  WatchDog
//
//  Created by JackChan on 2017/2/13.
//  Copyright © 2017年 JackChan. All rights reserved.
//

import Foundation

extension FOSDISCOVERY_NODE {
    
    var deviceMac: String {
        mutating get {
            return withUnsafePointer(to: &self.mac) {
                $0.withMemoryRebound(to: UInt8.self, capacity: MemoryLayout.size(ofValue: self.mac)) {
                    String(cString: $0)
                }
            }
        }
    }
    
    var deviceUID: String {
        mutating get {
            return withUnsafePointer(to: &uid) {
                $0.withMemoryRebound(to: UInt8.self, capacity: MemoryLayout.size(ofValue: uid)) {
                    String(cString: $0)
                }
            }
        }
    }
    
    var deviceName: String {
        mutating get {
            return withUnsafePointer(to: &name) {
                $0.withMemoryRebound(to: UInt8.self, capacity: MemoryLayout.size(ofValue: name)) {
                    String(cString: $0)
                }
            }
        }
    }
    
    var ipString: String {
        let inaddr = in_addr(s_addr: ip)
        return String(cString: inet_ntoa(inaddr))
    }
}
