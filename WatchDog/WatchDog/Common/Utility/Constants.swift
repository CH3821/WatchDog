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
        
        /// View 相关
        struct View {
            /// 背景色
            static let background = UIColor(238, 238, 240)
        }
        
        /// NavigationController 相关
        struct NavigationController {
            static let barTint = UIColor(0, 150, 235)
            static let foreground = UIColor.white
        }
        
        /// UITableView 相关
        struct TableView {
            
            /// TableViewCell title颜色值
            static let title = UIColor(81, 89, 91)
            
            /// TableViewCell 文本颜色值
            static let text = UIColor(100, 100, 100)
            
            /// TableViewCell detailLabel颜色值
            static let detail = UIColor(150, 150, 150)
            
            /// TableViewCell 提示文本颜色值
            static let tips = UIColor(180, 180, 180)
        }
    }
    
    
    /// 工程字体大小相关常量值
    struct Font {
        
        /// 导航栏Title字体大小
        static let navigationBar = UIFont.systemFont(ofSize: 21)
        
        /// title文字大小
        static let title = UIFont.systemFont(ofSize: 17)
        
        /// 按钮文字大小
        static let button = UIFont.systemFont(ofSize: 17)
        
        /// 正文文字大小
        static let main = UIFont.systemFont(ofSize: 16)
        
        /// 文本框文字大小
        static let textFiled = UIFont.systemFont(ofSize: 15)
        
        /// 提示性文字大小
        static let tips = UIFont.systemFont(ofSize: 14)
        
        /// 辅助性文字大小
        static let help = UIFont.systemFont(ofSize: 11)
    }
    
}
