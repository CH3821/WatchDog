//
//  BaseViewController.swift
//  WatchDog
//
//  Created by JackChan on 2017/2/14.
//  Copyright © 2017年 JackChan. All rights reserved.
//

import UIKit
import MBProgressHUD
import SnapKit

fileprivate struct BaseVCUX {
    struct HUD {
        static let CornerRadius: CGFloat = 8
        static let MinSize = CGSize(width: 32, height: 32)
        static let TextColor = UIConstants.Color.TextColor
        static let Font = UIConstants.Font.Tips
        static let DefaultText = "请稍后..."
        private init() {}
    }
    
    private init() {}
}

class BaseViewController: UIViewController {

    // MARK: - Properties
    lazy var hud: MBProgressHUD = {
        let hud = MBProgressHUD()
        hud.bezelView.layer.cornerRadius = BaseVCUX.HUD.CornerRadius
        hud.minSize = BaseVCUX.HUD.MinSize
        hud.label.textColor = BaseVCUX.HUD.TextColor
        hud.label.font = BaseVCUX.HUD.Font
        return hud
    }()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = UIConstants.Color.BackgroundColor
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        view.addSubview(hud)
        
        layoutPageSubviews()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    deinit {
        Log.debug("... \(self.className) deinit")
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

// MARK: - Public Methods
extension BaseViewController: PublicMethods {
    public func showLoading(message: String? = BaseVCUX.HUD.DefaultText) {
        if let message = message {
            hud.label.text = message
        }
        hud.show(animated: true)
    }
    
    public func hideLoading() {
        hud.hide(animated: true)
    }
}

// MARK: - Private Methods
extension BaseViewController: PrivateMethods {
    fileprivate func layoutPageSubviews() {
        hud.snp.makeConstraints { (make) in
            make.center.equalTo(self.view)
            make.size.greaterThanOrEqualTo(BaseVCUX.HUD.MinSize)
        }
    }
}

extension BaseViewController {
    
    override var prefersStatusBarHidden: Bool {
        return false
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
}
