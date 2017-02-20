//
//  StringExtension.swift
//  WatchDog
//
//  Created by JackChan on 2017/2/20.
//  Copyright © 2017年 JackChan. All rights reserved.
//

import Foundation

extension String {
    var UTF8CString: UnsafeMutablePointer<Int8> {
        return UnsafeMutablePointer(mutating: (self as NSString).utf8String!)
    }
}
