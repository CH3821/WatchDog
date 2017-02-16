//
//  UIConstants.swift
//  WatchDog
//
//  Created by JackChan on 2017/2/16.
//  Copyright © 2017年 JackChan. All rights reserved.
//

import UIKit

/// UI 相关常量属性
struct UIConstants {
    
    /// 颜色 相关常量属性
    struct Color {
        
        /// 蓝色 工程主色调
        static let BlueColor = UIColor(5, 175, 235)
        
        /// 红色 错误提示颜色值
        static let RedColor = UIColor(255, 55, 50)
        
        /// 绿色 成功提示颜色值
        static let GreenColor = UIColor(60, 200, 20)
        
        /// 文本颜色值
        static let TextColor = UIColor(100, 100, 100)
        
        /// 提示文本颜色值
        static let TipsColor = UIColor(180, 180, 180)
        
        /// 禁用颜色值
        static let DisableColor = UIColor(200, 200, 200)
        
        /// 虚线颜色值
        static let DashedColor = UIColor(211, 211, 211)
        
        /// View 背景值
        static let BackgroundColor = UIColor(240, 240, 240)
    }
    
    /// 字体 相关常量属性
    struct Font {
        /// 导航栏Title字体大小
        static let NavigationBar = UIFont.systemFont(ofSize: 21)
        
        /// title文字大小
        static let Title = UIFont.systemFont(ofSize: 17)
        
        /// 按钮文字大小
        static let Button = UIFont.systemFont(ofSize: 17)
        
        /// 正文文字大小
        static let Main = UIFont.systemFont(ofSize: 16)
        
        /// 文本框文字大小
        static let TextFiled = UIFont.systemFont(ofSize: 15)
        
        /// 提示性文字大小
        static let Tips = UIFont.systemFont(ofSize: 14)
        
        /// 辅助性文字大小
        static let Help = UIFont.systemFont(ofSize: 11)
    }
    
    /// 布局 相关常量属性
    struct Layout {
        
        /// 圆角大小
        static let CornerRadius: CGFloat = 3
    }
    
}
