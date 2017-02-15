//
//  DeviceHelper.swift
//  WatchDog
//
//  Created by JackChan on 2017/2/15.
//  Copyright © 2017年 JackChan. All rights reserved.
//

import Foundation
import SystemConfiguration.CaptiveNetwork

class DeviceHelper {

    func getCurrentSSID() -> String? {
        var ssid: String?
        if let interfaces = CNCopySupportedInterfaces() as NSArray? {
            for interface in interfaces {
                if let interfaceInfo = CNCopyCurrentNetworkInfo(interface as! CFString) as NSDictionary? {
                    ssid = interfaceInfo[kCNNetworkInfoKeySSID as String] as? String
                    break
                }
            }
        }
        return ssid
    }
}
