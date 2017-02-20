//
//  AddViewController.swift
//  WatchDog
//
//  Created by JackChan on 2017/2/20.
//  Copyright © 2017年 JackChan. All rights reserved.
//

import UIKit

class AddViewController: BaseViewController {

    var createModel: CreateModel
    
    // MARK: - Life Cycle
    init(createModel: CreateModel) {
        self.createModel = createModel
        super.init(nibName: nil, bundle: nil)
        
        Log.debug("createModel: \(createModel)")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "Add Device"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        addDevice()
    }
    
    // MARK: - Private Methods
    func addDevice() {
        let addDevice = AddDevice(createModel: createModel)
        addDevice.begin()
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
