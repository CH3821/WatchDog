//
//  HomeViewController.swift
//  WatchDog
//
//  Created by JackChan on 2017/2/14.
//  Copyright © 2017年 JackChan. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {

    // MARK: - Properties
    private lazy var rightBarButton: UIBarButtonItem = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "AddDevice"), for: .normal)
        button.addTarget(self, action: #selector(rightBarButtonDidTap(sender:)), for: .touchUpInside)
        button.sizeToFit()
        return UIBarButtonItem(customView: button)
    }()
    
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "Devices"
        navigationItem.rightBarButtonItem = rightBarButton
    }

    // MARK: - Event Response
    func rightBarButtonDidTap(sender: UIButton) {
        let vc = TViewController()
        self.navigationController?.pushViewController(vc, animated: true)
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
