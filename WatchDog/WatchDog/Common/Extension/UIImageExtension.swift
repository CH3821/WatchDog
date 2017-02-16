//
//  UIImageExtension.swift
//  WatchDog
//
//  Created by JackChan on 2017/2/16.
//  Copyright © 2017年 JackChan. All rights reserved.
//

import UIKit

extension UIImage {
    
    convenience init?(color: UIColor, size: CGSize = CGSize(width: 1, height: 1)) {
        
        UIGraphicsBeginImageContextWithOptions(size, true, UIScreen.main.scale)
        
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(color.cgColor)
        context?.fill(CGRect(origin: CGPoint.zero, size: size))
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        guard let cgImage = image?.cgImage else {
            return nil
        }
        
        self.init(cgImage: cgImage)
    }
}
