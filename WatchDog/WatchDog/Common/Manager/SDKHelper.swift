//
//  SDKHelper.swift
//  WatchDog
//
//  Created by JackChan on 2017/2/15.
//  Copyright © 2017年 JackChan. All rights reserved.
//

import Foundation

class SDKHelper {

    /// 搜索局域网中存在的设备
    ///
    /// - Returns: FOSDISCOVERY_NODE数组
    static func devicesInLan() -> [FOSDISCOVERY_NODE] {
        
        let maxSize = 20
        var nodes = [FOSDISCOVERY_NODE](repeating: FOSDISCOVERY_NODE(), count: maxSize)
        var size: Int32 = Int32(maxSize)
        let timeOut: Int32 = 500
        
        let result = FosSdk_Discovery(&nodes, &size, timeOut)
        
        guard result == FOSCMDRET_OK else {
            return []
        }
        
        return Array(nodes.prefix(Int(size)))
    }
}
