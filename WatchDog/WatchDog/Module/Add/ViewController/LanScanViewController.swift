//
//  LanScanViewController.swift
//  WatchDog
//
//  Created by JackChan on 2017/2/15.
//  Copyright © 2017年 JackChan. All rights reserved.
//

import UIKit
import SnapKit

class LanScanViewController: BaseViewController {
    
    // MARK: - Properties
    let kCellID = "CellID"
    
    var dataSource = [FOSDISCOVERY_NODE]()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: self.view.frame, style: .grouped)
        tableView.rowHeight = 64
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(LanScanCell.self, forCellReuseIdentifier: self.kCellID)
        return tableView
    }()
    
    lazy var headerView: UIView = {
        let headerView = UIView()
        headerView.backgroundColor = Constants.Color.View.background
        
        let headerLabel = UILabel()
        headerLabel.textColor = Constants.Color.TableView.title
        headerLabel.font = Constants.Font.main
        headerLabel.backgroundColor = Constants.Color.View.background
        headerLabel.text = self.headerTips
        
        headerView.addSubview(headerLabel)
        headerLabel.snp.makeConstraints({ (make) in
            make.left.equalTo(headerView).offset(20)
            make.centerY.height.right.equalTo(headerView)
        })
        
        return headerView
    }()
    
    var headerTips: String {
        if let ssid = DeviceHelper().getCurrentSSID() {
            return "\(ssid)中存在以下设备:"
        } else {
            return "当前局域网中搜索到以下设备:"
        }
    }
    
    let rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(rightBarButtonDidTap(sender:)))
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        title = "选择设备"
        
        view.addSubview(tableView)
        navigationItem.rightBarButtonItem = rightBarButtonItem
        
        layoutPageSubviews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchDeviceList()
    }
    
    // MARK: - Private Methods
    func layoutPageSubviews() {
        tableView.snp.makeConstraints { (make) in
            make.edges.equalTo(view)
        }
    }
    
    func fetchDeviceList() {
        dataSource = SDKHelper.devicesInLan()
        tableView.reloadData()
    }
    
    // MARK: - Event Response
    func rightBarButtonDidTap(sender: UIButton) {
        fetchDeviceList()
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

extension LanScanViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kCellID)
        return cell!
    }
}

extension LanScanViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        guard dataSource.count > 0 else {
            return 0.0001
        }
        
        return 44
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard dataSource.count > 0 else {
            return nil
        }
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let thisCell = cell as! LanScanCell
        var node = dataSource[indexPath.row]
        
        thisCell.deviceName = node.deviceName
        thisCell.deviceIP = "\(node.ipString):\(node.port)"
        thisCell.deviceUID = node.deviceUID
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
