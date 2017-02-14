//
//  Constants.swift
//  WatchDog
//
//  Created by JackChan on 2017/2/14.
//  Copyright © 2017年 JackChan. All rights reserved.
//

import UIKit

struct Constants {
    
    /// 颜色相关常量值
    struct Color {
        
        /// ViewController 相关
        struct ViewController {
            /// 背景色
            static let background = UIColor(238, 238, 240)
        }
        
        /// NavigationController 相关
        struct NavigationController {
            static let barTint = UIColor(0, 150, 235)
            static let foreground = UIColor.white
        }
    }
    
    
    /// 字体大小相关常量值
    struct Font {
        static let navigationBar = UIFont.systemFont(ofSize: 21)
    }
    
}
