//
//  CreateModel.swift
//  WatchDog
//
//  Created by JackChan on 2017/2/20.
//  Copyright © 2017年 JackChan. All rights reserved.
//

import Foundation

/// CreateModel 用于创建连接
struct CreateModel {
    
    /// 设备IP地址
    var ip: String = ""
    
    /// 设备DDNS地址
    var ddns: String = ""
    
    /// 设备UID
    var uid: String = ""
    
    /// 用户名，默认admin
    var user: String = "admin"
    
    /// 密码，默认为空
    var password: String = ""
    
    /// IP 端口号，默认88
    var webPort: UInt16 = 88
    
    /// IP 媒体端口号，默认88
    var mediaPort: UInt16 = 88
    
    /// DDNS 端口号，默认88
    var ddnsWebPort: UInt16 = 88
    
    /// DDNS 媒体端口号，默认88
    var ddnsMediaPort: UInt16 = 88
    
    /// 设备Mac地址
    var mac: String = ""
    
    /// 设备类型
    var type: FOSIPC_TYPE = FOSIPC_H264
    
    /// 建立连接的类型
    var connectType: FOSIPC_CONNECTTION_TYPE = FOSCNTYPE_P2P
    
    /// 码流类型
    var streamType: FOSSTREAM_TYPE = FOSSTREAM_MAIN
}

extension CreateModel {
    init(node: FOSDISCOVERY_NODE) {
        self.ip = node.ipString
        self.uid = node.deviceUID
        self.webPort = node.port
        self.mediaPort = node.mediaPort
        self.ddnsWebPort = node.port
        self.ddnsMediaPort = node.mediaPort
        self.mac = node.deviceMac
        self.type = node.type
    }
}

extension CreateModel: CustomStringConvertible {
    var description: String {
        get {
            let dict: [String: Any] = ["ip"             : ip,
                                       "ddns"           : ddns,
                                       "uid"            : uid,
                                       "user"           : user,
                                       "password"       : password,
                                       "webPort"        : webPort,
                                       "mediaPort"      : mediaPort,
                                       "ddnsWebPort"    : ddnsWebPort,
                                       "ddnsMediaPort"  : ddnsMediaPort,
                                       "mac"            : mac,
                                       "type"           : type.rawValue,
                                       "connectType"    : connectType.rawValue,
                                       "streamType"     : streamType.rawValue
                                       ]
            return dict.description
        }
    }
}
