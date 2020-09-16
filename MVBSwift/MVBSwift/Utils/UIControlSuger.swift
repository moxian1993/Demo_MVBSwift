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
    
        @discardableResult func _img(_ image: Any) -> Self {
            setImage(_Img(obj: image), for: .normal)
            return self
        }
    
        @discardableResult func _highImg(_ image: Any) -> Self {
            setImage(_Img(obj: image), for: .highlighted)
            return self
        }
    
        @discardableResult func _selectedImg(_ image: Any) -> Self {
            setImage(_Img(obj: image), for: .selected)
            return self
        }
    
        @discardableResult func _disableImg(_ image: Any) -> Self {
            setImage(_Img(obj: image), for: .disabled)
            return self
        }
    
        @discardableResult func _bgImg(_ image: Any) -> Self {
            setBackgroundImage(_Img(obj: image), for: .normal)
            return self
        }
    
        @discardableResult func _highBgImg(_ image: Any) -> Self {
            setBackgroundImage(_Img(obj: image), for: .highlighted)
            return self
        }
    
        @discardableResult func _selectedBgImg(_ image: Any) -> Self {
            setBackgroundImage(_Img(obj: image), for: .selected)
            return self
        }
    
        @discardableResult func _disableBgImg(_ image: Any) -> Self {
            setBackgroundImage(_Img(obj: image), for: .disabled)
            return self
        }
    
    
}
