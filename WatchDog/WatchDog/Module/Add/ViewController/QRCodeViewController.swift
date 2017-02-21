//
//  QRCodeViewController.swift
//  WatchDog
//
//  Created by JackChan on 2017/2/21.
//  Copyright © 2017年 JackChan. All rights reserved.
//

import UIKit
import AVFoundation

class QRCodeViewController: BaseViewController {

    // MARK: - Properties
    let device: AVCaptureDevice
    
    var deviceInput: AVCaptureDeviceInput?
    
    let deviceOutput: AVCaptureMetadataOutput?
    
    let session: AVCaptureSession
    
    let previewLayer: AVCaptureVideoPreviewLayer
    
    // MARK: - Life Cycle
    init() {
        
        device = AVCaptureDevice.defaultDevice(withMediaType: AVMediaTypeVideo)
        
        do {
            try deviceInput = AVCaptureDeviceInput(device: device)
        } catch _ {
            Log.error("")
        }
        
        deviceOutput = AVCaptureMetadataOutput()
        
        session = AVCaptureSession()
        
        previewLayer = AVCaptureVideoPreviewLayer(session: session)
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initializer()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        session.startRunning()
    }

    // MARK: - Private Methods
    func initializer() {
        
        deviceOutput?.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
        
        if session.canAddInput(deviceInput) {
            session.addInput(deviceInput)
        }
        
        if session.canAddOutput(deviceOutput) {
            session.addOutput(deviceOutput)
        }
        
        deviceOutput?.metadataObjectTypes = [AVMetadataObjectTypeQRCode]
        
//        deviceOutput?.rectOfInterest = CGRect(x: 0.1, y: 0.3, width: 0.4, height: 0.4)
        
        previewLayer.frame = self.view.frame
        
        previewLayer.videoGravity = AVLayerVideoGravityResizeAspectFill
        
        self.view.layer.addSublayer(previewLayer)
        
        
        
        NotificationCenter.default.addObserver(forName: NSNotification.Name.AVCaptureInputPortFormatDescriptionDidChange, object: nil, queue: OperationQueue.current) { [weak self] (_) in
            
            if let strongSelf = self {
                strongSelf.deviceOutput?.rectOfInterest = strongSelf.previewLayer.metadataOutputRectOfInterest(for: CGRect(x: 100, y: 100, width: 200, height: 200))
            }
        }
    }
    
    // MARK: - Memory
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension QRCodeViewController: AVCaptureMetadataOutputObjectsDelegate {
    
    func captureOutput(_ captureOutput: AVCaptureOutput!, didOutputMetadataObjects metadataObjects: [Any]!, from connection: AVCaptureConnection!) {
        session.stopRunning()
        
        if let qrObject = metadataObjects.last,
            let qrString = (qrObject as! AVMetadataMachineReadableCodeObject).stringValue {
            Log.info("... 二维码扫描结果:\(qrString)")
        } else {
            session.startRunning()
        }
    }
}
