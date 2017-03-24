//
//  DeviceSource.swift
//  WatchDog
//
//  Created by Jack Chan on 2017/3/24.
//  Copyright © 2017年 JackChan. All rights reserved.
//

import Foundation

/// 设备数据源
class DeviceSource {
    
    // MARK: - Properties
    public static let deviceSource = DeviceSource()
    
    public var dataSource = [DeviceModel]()
    
    // MARK: - Lifecycle
    private init() {
        dataSource = deviceArrayFromDB()
    }
}

// MARK: - Public Methods
extension DeviceSource: PublicMethods {

    /// 添加新设备对象到设备数据源
    ///
    /// - Parameter model: 新设备对象
    func addDevice(model: DeviceModel) {
        // 删除数组中已存在的相同对象
        let deviceMac = model.deviceMac
        _ = delete(deviceMac: deviceMac)
        
        // 将新设备对象据添加数组头部
        dataSource.insert(model, at: 0)
    }
    
    /// 从设备数据源删除设备对象
    ///
    /// - Parameter model: 删除设备对象
    /// - Returns: 删除结果
    func delete(model: DeviceModel) -> Bool {
        let deviceMac = model.deviceMac
        return delete(deviceMac: deviceMac)
    }
    
    /// 获取MAC地址对应设备对象
    ///
    /// - Parameter deviceMac: Mac地址
    /// - Returns: MAC地址对应设备对象
    func deviceModel(from deviceMac: String) -> DeviceModel? {
        let result = dataSource.filter() {
            return ($0.deviceMac == deviceMac)
        }
        return result.first
    }
}

// MARK: - Private Methods
extension DeviceSource: PrivateMethods {
    
    /// 从数据库读取数据
    ///
    /// - Returns: 数据库设备列表
    func deviceArrayFromDB() -> [DeviceModel] {
        // TODO: - 从数据库读取数据
        return [DeviceModel]()
    }
    
    func delete(deviceMac: String) -> Bool {
        let count = dataSource.count
        dataSource = dataSource.filter() {
            return ($0.deviceMac != deviceMac)
        }
        
        return (dataSource.count != count)
    }
}
