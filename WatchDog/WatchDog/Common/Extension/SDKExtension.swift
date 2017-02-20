//
//  SDKExtension.swift
//  WatchDog
//
//  Created by JackChan on 2017/2/15.
//  Copyright © 2017年 JackChan. All rights reserved.
//

import Foundation

extension FOSDISCOVERY_NODE {
    
    var deviceMac: String {
        get {
            var temp = self.mac
            return withUnsafePointer(to: &temp) {
                $0.withMemoryRebound(to: UInt8.self, capacity: MemoryLayout.size(ofValue: temp)) {
                    String(cString: $0)
                }
            }
        }
    }
    
    var deviceUID: String {
        get {
            var temp = self.uid
            return withUnsafePointer(to: &temp) {
                $0.withMemoryRebound(to: UInt8.self, capacity: MemoryLayout.size(ofValue: temp)) {
                    String(cString: $0)
                }
            }
        }
    }
    
    var deviceName: String {
        get {
            var temp = self.name
            return withUnsafePointer(to: &temp) {
                $0.withMemoryRebound(to: UInt8.self, capacity: MemoryLayout.size(ofValue: temp)) {
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

extension FOSDISCOVERY_NODE: CustomStringConvertible {
    public var description: String {
        get {
            let dict: [String : Any] = ["mac"           : deviceMac,
                                        "name"          : deviceName,
                                        "ip"            : ipString,
                                        "mask"          : mask,
                                        "gateway"       : gateway,
                                        "dns"           : dns,
                                        "type"          : type.rawValue,
                                        "mediaPort"     : mediaPort,
                                        "port"          : port,
                                        "sys_ver"       : sys_ver,
                                        "app_ver"       : app_ver,
                                        "dhcp_enabled"  : dhcp_enabled,
                                        "uid"           : deviceMac,
                                        ]
            return dict.description
        }
    }
}
