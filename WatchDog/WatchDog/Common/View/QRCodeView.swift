//
//  QRCodeView.swift
//  WatchDog
//
//  Created by JackChan on 2017/2/21.
//  Copyright © 2017年 JackChan. All rights reserved.
//

import UIKit
import AVFoundation
import SnapKit

/// QRCodeView 协议
protocol QRCodeProtocol: class {
    
    /// 扫描结果回调
    ///
    /// - Parameters:
    ///   - qrCodeView: QRCodeView 对象
    ///   - outputString: 扫描结果字符串
    func qrCodeView(_ qrCodeView: QRCodeView, outputString: String)
    
    /// 扫描提示语
    ///
    /// - Parameter qrCodeView: QRCodeView 对象
    /// - Returns: 提示语字符串
    func tipsString(in qrCodeView: QRCodeView) -> String
}

extension QRCodeProtocol {
    func tipsString(in qrCodeView: QRCodeView) -> String {
        return "请将二维码放入框内"
    }
}

class QRCodeView: UIView {
    
    // MARK: - Properties
    weak var delegate: QRCodeProtocol?
    
    let device: AVCaptureDevice
    
    var deviceInput: AVCaptureDeviceInput?
    
    let deviceOutput: AVCaptureMetadataOutput
    
    let session: AVCaptureSession
    
    let previewLayer: AVCaptureVideoPreviewLayer
    
    let maskColor = UIColor(white: 0, alpha: 0.7)
    
    let qrSize = CGSize(width: 200, height: 200)
    
    lazy var leftMaskView = UIView.maskView()
    
    lazy var rightMaskView = UIView.maskView()
    
    // MARK: - Life Cycle
    override init(frame: CGRect) {
        
        device = AVCaptureDevice.defaultDevice(withMediaType: AVMediaTypeVideo)
        
        do {
            try deviceInput = AVCaptureDeviceInput(device: device)
        } catch _ {
            Log.error("### AVCaptureDeviceInput Error")
        }
        
        deviceOutput = AVCaptureMetadataOutput()
        
        session = AVCaptureSession()
        
        previewLayer = AVCaptureVideoPreviewLayer(session: session)
        
        super.init(frame: frame)
        
        initialzier()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Override
    override func layoutSubviews() {
        previewLayer.frame = CGRect(origin: CGPoint.zero, size: frame.size)
    }
    
    // MARK: - Private Methods
    func initialzier() {
        deviceOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
        
        if session.canAddInput(deviceInput) {
            session.addInput(deviceInput)
        }
        
        if session.canAddOutput(deviceOutput) {
            session.addOutput(deviceOutput)
        }
        
        deviceOutput.metadataObjectTypes = [AVMetadataObjectTypeQRCode]
        
        previewLayer.frame = CGRect(origin: CGPoint.zero, size: frame.size)
        previewLayer.videoGravity = AVLayerVideoGravityResizeAspectFill
        layer.addSublayer(previewLayer)
        
        session.startRunning()
        
        NotificationCenter.default.addObserver(forName: NSNotification.Name.AVCaptureInputPortFormatDescriptionDidChange, object: nil, queue: OperationQueue.current) { [weak self] (_) in
            if let strongSelf = self {
                // TODO: 需修改为指定框frame
                strongSelf.deviceOutput.metadataOutputRectOfInterest(for: CGRect(x: 100, y: 100, width: 200, height: 200))
            }
        }
        /*
        addSubview(leftMaskView)
        addSubview(rightMaskView)
        */
        layoutPageSubviews()
    }
    
    func layoutPageSubviews() {
        /*
        leftMaskView.snp.makeConstraints { (make) in
            make.top.bottom.left.equalTo(self)
            make.centerX.equalTo(self).multipliedBy(0.25)
        }
        
        rightMaskView.snp.makeConstraints { (make) in
            make.top.bottom.right.equalTo(self)
            make.centerX.equalTo(self).multipliedBy(0.75)
        }*/
    }
}

extension QRCodeView: AVCaptureMetadataOutputObjectsDelegate {
    func captureOutput(_ captureOutput: AVCaptureOutput!, didOutputMetadataObjects metadataObjects: [Any]!, from connection: AVCaptureConnection!) {
        
        if let qrObject = metadataObjects.last as? AVMetadataMachineReadableCodeObject,
            let qrString = qrObject.stringValue {
            session.stopRunning()
            
            print(qrString)
        }
    }
}

extension UIView {
    static func maskView() -> UIView {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0, alpha: 0.7)
        return view
    }
}
