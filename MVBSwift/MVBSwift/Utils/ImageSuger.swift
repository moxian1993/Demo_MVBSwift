//
//  ImageSuger.swift
//  MVBSwift
//
//  Created by Xian Mo on 2020/9/15.
//  Copyright © 2020 Mo. All rights reserved.
//

import Foundation
import UIKit

/// 是否允许颜色图片
fileprivate var allowColorImage: Bool {
    return true
}

/// 多渠道生成图片
/// - Parameter obj: String. UIColor. UIImage
/// - Returns: image
@discardableResult func _Img(obj: Any) -> UIImage? {
    if obj is UIImage {
        return obj as? UIImage
    }
    
    if let strObj = obj as? String {
        let stretchImage = strObj.hasPrefix("#")
        let sub = String(strObj[strObj.index(strObj.startIndex, offsetBy: 1)..<strObj.endIndex])
        let imageName = stretchImage ? sub : strObj
        
        var image = UIImage(named: imageName)
        
        if stretchImage {
            if image == nil {
                image = UIImage(named: strObj)
            } else {
                return image!.stretchableImage()
            }
        }
        
        if allowColorImage, image == nil {
            image = UIImage._colorImage(_Color(strObj))
        }
        return image
    }
    return nil
}

extension UIImage {
    
    /// 颜色图片
    /// - Parameter color: color
    /// - Returns: image
    @discardableResult class func _colorImage(_ color: UIColor?) -> UIImage? {
        guard color != nil else {
            return nil
        }
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        let hasAlpha = colorHasAlphaChannel(color!)
        
        UIGraphicsBeginImageContextWithOptions(rect.size, !hasAlpha, UIScreen.main.scale)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(color!.cgColor)
        context?.fill(rect)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image
    }
    
    
    fileprivate func stretchableImage() -> UIImage {
        let halfWidth = size.width/2
        let halfHeight = size.height/2
        let insets = UIEdgeInsets(top: halfHeight-1.0, left: halfWidth-1.0, bottom: halfHeight, right: halfWidth)
        return resizableImage(withCapInsets: insets, resizingMode: .stretch)
    }
    
    
    fileprivate class func colorHasAlphaChannel(_ color: UIColor) -> Bool {
        return color.cgColor.alpha < 1
    }
    
    
}
