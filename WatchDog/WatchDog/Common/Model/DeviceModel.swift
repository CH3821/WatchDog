//
//  DeviceModel.swift
//  WatchDog
//
//  Created by Jack Chan on 2017/3/24.
//  Copyright © 2017年 JackChan. All rights reserved.
//

import Foundation

struct DeviceModel {
    /// 设备MAC地址(唯一标识)
    let deviceMac: String
    
    /// 设备句柄
    var handle: UInt32
    
    /// 创建连接数据模型
    var createModel: CreateModel
}
