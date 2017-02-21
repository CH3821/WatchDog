//
//  TViewController.swift
//  WatchDog
//
//  Created by JackChan on 2017/2/21.
//  Copyright © 2017年 JackChan. All rights reserved.
//

import UIKit
import SnapKit

class TViewController: BaseViewController {

    // MARK: - Properties
    lazy var qrCodeView: QRCodeView = {
        let qrCodeView = QRCodeView()
        qrCodeView.delegate = self
        return qrCodeView
    }()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "Scan"
        view.addSubview(qrCodeView)
        layoutPageSubviews()
    }

    // MARK: - Private Methods
    func layoutPageSubviews() {
        qrCodeView.snp.makeConstraints { (make) in
            make.edges.equalTo(view)
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

extension TViewController: QRCodeProtocol {
    func qrCodeView(_ qrCodeView: QRCodeView, outputString: String) {
        print(outputString)
    }
}
