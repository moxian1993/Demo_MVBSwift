//
//  UIKitSuger.swift
//  MVBSwift
//
//  Created by Xian Mo on 2020/9/16.
//  Copyright © 2020 Mo. All rights reserved.
//

import Foundation
import UIKit

#if swift(>=4.2)
typealias _UIFontTextStyle = UIFont.TextStyle

#else
typealias _UIFontTextStyle = UIFontTextStyle

#endif

/**
 * Create UIFont object.
 * Font argument can be:
    1) UIFont object
    2) 15: systemFontOfSize 15
    3) "15": boldSystemFontOfSize 15
    4) "headline", "body", "caption1", and any other UIFontTextStyle.
    5) "Helvetica,15": fontName + fontSize, separated by comma.
 
 * Usages:
    Font(someLabel.font),
    Font(15)
    Font("15")
    Font("body")
    Font("Helvetica,15")
    ...
 */
public func _Font(_ any: Any) -> UIFont {
    if let font = any as? UIFont {
        return font
    }
    
    if let string = any as? String {
        let elements = string.components(separatedBy: ",")
        if elements.count == 2 {
            return UIFont(name: elements[0], size: CGFloat(Float(elements[1])!))!
        }
        
        if let fontSize = Float(string), fontSize > 0 {
            return UIFont.boldSystemFont(ofSize: CGFloat(fontSize))
        }
        
        let value = "UICTFontTextStyle" + string.capitalized
        return UIFont.preferredFont(forTextStyle: _UIFontTextStyle(rawValue: value))
    }
    
    return UIFont.systemFont(ofSize: _CGFloat(any))
}
