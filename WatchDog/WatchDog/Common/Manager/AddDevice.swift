//
//  AddDevice.swift
//  WatchDog
//
//  Created by JackChan on 2017/2/20.
//  Copyright © 2017年 JackChan. All rights reserved.
//

import Foundation

/// 设备添加步骤
///
/// - begin: 开始添加
/// - login: 登录设备
/// - fetchInfo: 获取信息
/// - widget: 其它设置
enum AddDeviceSteps {
    case begin
    case login
    case fetchInfo
    case widget
}

/// 设备添加协议
protocol AddDeviceProtocol: class {
    
    /// 设备添加结果
    ///
    /// - Parameters:
    ///   - addDevice: AddDevice 对象
    ///   - productAllInfo: 设备产品信息结构体
    ///   - deviceInfo: 设备信息结构体
    func addDevice(_ addDevice: AddDevice, productAllInfo: FOS_PRODUCTALLINFO, deviceInfo: FOS_DEVINFO)
    
    /// 设备添加步骤回调
    ///
    /// - Parameters:
    ///   - addDevice: AddDevice 对象
    ///   - step: 当前所处步骤
    func addDevice(_ addDevice: AddDevice, step: AddDeviceSteps)
    
    /// 设备添加失败
    ///
    /// - Parameters:
    ///   - addDevice: AddDevice 对象
    ///   - step: 失败所处步骤
    ///   - cmdResult: 失败原因
    func addDevice(_ addDevice: AddDevice, failedAtStep step: AddDeviceSteps, cmdResult: FOSCMD_RESULT)
}

/// 用于设备添加
class AddDevice {
    
    // MARK: - Properties
    weak var delegate: AddDeviceProtocol?
    
    var createModel: CreateModel
    
    var handle: UInt32 = 0
    
    private let serialQueue = DispatchQueue(label: "com.JackChan.AddDevice")
    
    // MARK: - Life Cycle
    init(createModel: CreateModel) {
        self.createModel = createModel
        self.handle = FosSdk_Create3(createModel.ip.UTF8CString, createModel.ddns.UTF8CString, createModel.uid.UTF8CString, createModel.user.UTF8CString, createModel.password.UTF8CString, createModel.webPort, createModel.mediaPort, createModel.ddnsWebPort, createModel.ddnsMediaPort, createModel.mac.UTF8CString, createModel.type, createModel.connectType, createModel.streamType)
        
        Log.info("createModel: \(self.createModel)\nFosSdk_Create3: \(self.handle)")
    }
    
    // MAKR: - Public Methods
    func begin() {
        serialQueue.async {
            self.login()
        }
    }
    
    // MARK: - Private Methods
    func login() {
        let timeOut: Int32 = 3000
        
        var usrPrivilege: Int32 = 0
        let loginRes = FosSdk_Login(handle, &usrPrivilege, timeOut)
        print(loginRes)
        
        var productAllInfo = FOS_PRODUCTALLINFO()
        let productRes = FosSdk_GetProductAllInfo(handle, timeOut, &productAllInfo)
        print(productRes)
        
        var deviceInfo = FOS_DEVINFO()
        let deviceRes = FosSdk_GetDevInfo(handle, timeOut, &deviceInfo)
        print(deviceRes)
    }
    
}
