//
//  JCNavigationController.swift
//  WatchDog
//
//  Created by JackChan on 2017/2/14.
//  Copyright © 2017年 JackChan. All rights reserved.
//

import UIKit

class JCNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationBar.barTintColor = UIConstants.Color.BlueColor
        navigationBar.titleTextAttributes = [NSFontAttributeName : UIConstants.Font.NavigationBar,
                                             NSForegroundColorAttributeName : UIColor.white]
        navigationBar.tintColor = UIColor.white
    }

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

extension JCNavigationController {
    
    override var prefersStatusBarHidden: Bool {
        
        if let topViewController = topViewController {
            return topViewController.prefersStatusBarHidden
        } else {
            return false
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        
        if let topViewController = topViewController {
            return topViewController.preferredStatusBarStyle
        } else {
            return .lightContent
        }
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        
        if let topViewController = topViewController {
            return topViewController.supportedInterfaceOrientations
        } else {
            return .portrait
        }
    }
    
}
