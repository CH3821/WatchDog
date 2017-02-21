//
//  NSObjectExtension.swift
//  WatchDog
//
//  Created by JackChan on 2017/2/21.
//  Copyright © 2017年 JackChan. All rights reserved.
//

import Foundation

extension NSObject {
    var className: String {
        let className = NSStringFromClass(type(of: self)).components(separatedBy: ".").last
        return className ?? "Unkown Object"
    }
}
