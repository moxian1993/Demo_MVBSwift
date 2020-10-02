//
//  UIControlSuger.swift
//  MVBSwift
//
//  Created by Xian Mo on 2020/9/15.
//  Copyright © 2020 Mo. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    
    @discardableResult func _img(_ image: Any, for state: UIControl.State = .normal) -> Self {
        setImage(_Img(obj: image), for: state)
        return self
    }
    
    @discardableResult func _bgImg(_ image: Any, for state: UIControl.State = .normal) -> Self {
        setBackgroundImage(_Img(obj: image), for: state)
        return self
    }
    
    /**
     * Setting normal title or normal attributedTitle
     * str can take any kind of value, even primitive type like Int.
     * Usages:
        .str(1024)
        .str("hello world")
        .str( AttStr("hello world").strikethrough() )
        ...
     */
    @discardableResult func _str(_ any: Any?) -> Self {
        if let attStr = any as? NSAttributedString {
            setAttributedTitle(attStr, for: .normal)
        } else if let any = any {
            setTitle(String(describing: any), for: .normal)
        } else {
            setTitle(nil, for: .normal)
        }
        return self
    }
    
    
    /**
     * Setting font
     * font use Font() internally, so it can take any kind of values that Font() supported.
     * See Font.siwft for more information.
     * Usages:
        .font(15)
        .font("20")
        .font("body")
        .font("Helvetica,15")
        .font(someLabel.font)
        ...
     **/
    @objc @discardableResult func _font(_ any: Any) -> Self {
        self.titleLabel?.font = _Font(any)
        return self
    }
    
    
    /**
     * Setting titleColor
     * color use Color() internally, so it can take any kind of values that Color() supported.
     * See Color.swift for more information.
     * Usages:
        .color(@"red")
        .color(@"#F00")
        .color(@"255,0,0")
        .color(someLabel.textColor)
        ...
     */
    @objc @discardableResult func _color(_ any: Any) -> Self {
        setTitleColor(_Color(any), for: .normal)
        return self
    }
    
    /**
     * Setting highlighted titleColor
     * highColor use Color() internally, so it can take any kind of values that Color() supported.
     * See Color.swift for more information.
     * Usages:
        .highColor(@"red")
        .highColor(@"#F00")
        .highColor(@"255,0,0")
        .highColor(someLabel.textColor)
        ...
     */
    @objc @discardableResult func _highColor(_ any: Any?) -> Self {
        setTitleColor(_Color(any), for: .highlighted)
        return self
    }
    
    
}
