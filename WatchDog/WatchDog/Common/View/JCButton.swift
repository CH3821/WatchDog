//
//  JCButton.swift
//  WatchDog
//
//  Created by JackChan on 2017/2/16.
//  Copyright © 2017年 JackChan. All rights reserved.
//

import UIKit

enum JCButtonType {
    case confirm
    case cancel
}

struct JCButtonUX {
    static let CornerRadius: CGFloat = UIConstants.Layout.CornerRadius
    static let Font = UIConstants.Font.Button
    
    struct Confirm {
        static let TitleText = "确定"
        static let TitleColor = UIColor.white
        static let DisableColor = UIConstants.Color.DisableColor
        
        static let BackgroundNormal = UIConstants.Color.BlueColor
        static let BackgroundHighlighted = UIColor(0, 150, 210)
        static let BackgroundDisabled = UIConstants.Color.DisableColor
    }
    
    struct Cancel {
        static let TitleText = "取消"
        static let TitleNormalColor = UIConstants.Color.TextColor
        static let TitleHighlightedColor = UIColor(150, 150, 150)
        static let DisableColor = UIConstants.Color.DisableColor
        
        static let BackgroundNormal = UIConstants.Color.BackgroundColor
        static let BackgroundHighlighted = UIConstants.Color.BackgroundColor
        static let BackgroundDisabled = UIConstants.Color.DisableColor
        
        static let BorderColor = UIColor(81, 89, 91)
    }
}

extension UIButton {
    convenience init(type: JCButtonType) {
        self.init(type: .custom)
        
        layer.cornerRadius = JCButtonUX.CornerRadius
        layer.masksToBounds = true
        
        titleLabel?.font = JCButtonUX.Font
        
        switch type {
        case .confirm:
            setTitle(JCButtonUX.Confirm.TitleText, for: .normal)
            
            setTitleColor(JCButtonUX.Confirm.TitleColor, for: .normal)
            setTitleColor(JCButtonUX.Confirm.TitleColor, for: .highlighted)
            setTitleColor(JCButtonUX.Confirm.DisableColor, for: .disabled)
            
            setBackgroundImage(UIImage(color: JCButtonUX.Confirm.BackgroundNormal), for: .normal)
            setBackgroundImage(UIImage(color: JCButtonUX.Confirm.BackgroundHighlighted), for: .highlighted)
            setBackgroundImage(UIImage(color: JCButtonUX.Confirm.BackgroundDisabled), for: .disabled)
            
        case .cancel:
            setTitle(JCButtonUX.Cancel.TitleText, for: .normal)
            
            setTitleColor(JCButtonUX.Cancel.TitleNormalColor, for: .normal)
            setTitleColor(JCButtonUX.Cancel.TitleHighlightedColor, for: .highlighted)
            setTitleColor(JCButtonUX.Cancel.DisableColor, for: .disabled)
            
            setBackgroundImage(UIImage(color: JCButtonUX.Cancel.BackgroundNormal), for: .normal)
            setBackgroundImage(UIImage(color: JCButtonUX.Cancel.BackgroundHighlighted), for: .highlighted)
            setBackgroundImage(UIImage(color: JCButtonUX.Cancel.BackgroundDisabled), for: .disabled)
            
            layer.borderWidth = 0.5
            layer.borderColor = JCButtonUX.Cancel.BorderColor.cgColor
        }
    }
}
