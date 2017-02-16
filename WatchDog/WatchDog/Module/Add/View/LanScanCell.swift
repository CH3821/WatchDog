//
//  LanScanCell.swift
//  WatchDog
//
//  Created by JackChan on 2017/2/15.
//  Copyright © 2017年 JackChan. All rights reserved.
//

import UIKit
import SnapKit

class LanScanCell: UITableViewCell {

    // MARK: - Properties
    var deviceName: String? {
        willSet {
            self.deviceNameLabel.text = newValue
        }
    }
    
    var deviceIP: String? {
        willSet {
            if let newValue = newValue {
                self.deviceIPLabel.text = "IP:\(newValue)"
            } else {
                self.deviceIPLabel.text = "IP: NULL"
            }
        }
    }
    
    var deviceUID: String? {
        willSet {
            if let newValue = newValue {
                self.deviceUIDLabel.text = "UID:\(newValue)"
            } else {
                self.deviceUIDLabel.text = "UID: NULL"
            }
        }
    }
    
    private var deviceNameLabel = UILabel()
    private var deviceIPLabel = UILabel()
    private var deviceUIDLabel = UILabel()
    
    // MARK: - Life Cycle
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        initializer()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    func initializer() {
        deviceNameLabel.textColor = UIConstants.Color.TextColor
        deviceNameLabel.font = UIConstants.Font.Main
        
        deviceIPLabel.textColor = UIConstants.Color.TipsColor
        deviceIPLabel.font = UIConstants.Font.Tips
        
        deviceUIDLabel.textColor = UIConstants.Color.TipsColor
        deviceUIDLabel.font = UIConstants.Font.Help
        
        self.addSubview(deviceNameLabel)
        self.addSubview(deviceIPLabel)
        self.addSubview(deviceUIDLabel)
        
        layoutPageSubviews()
    }
    
    func layoutPageSubviews() {
        deviceNameLabel.snp.makeConstraints { (make) in
            make.top.width.equalTo(self)
            make.left.equalTo(self).offset(20)
            make.height.equalTo(28)
        }
        
        deviceIPLabel.snp.makeConstraints { (make) in
            make.left.width.equalTo(deviceNameLabel)
            make.top.equalTo(deviceNameLabel.snp.bottom)
            make.height.equalTo(deviceUIDLabel)
        }
        
        deviceUIDLabel.snp.makeConstraints { (make) in
            make.top.equalTo(deviceIPLabel.snp.bottom)
            make.left.width.equalTo(deviceIPLabel)
            make.bottom.equalTo(self)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
