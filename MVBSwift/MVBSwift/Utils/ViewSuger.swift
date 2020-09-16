//
//  ViewSuger.swift
//  MVBSwift
//
//  Created by Xian Mo on 2020/9/15.
//  Copyright © 2020 Mo. All rights reserved.
//

import Foundation
import UIKit

//MARK: - Base
extension UIView {
    
    var origin: CGPoint {
        get { return frame.origin }
        set { frame.origin = newValue }
    }
    
    var x: CGFloat {
        get { return origin.x }
        set { origin.x = newValue }
    }
    
    var y: CGFloat {
        get { return origin.y }
        set { origin.y = newValue }
    }
    
    var size: CGSize {
        get { return frame.size }
        set { frame.size = newValue }
    }
    
    var width: CGFloat {
        get { return size.width }
        set { size.width = newValue }
    }
    
    var height: CGFloat {
        get { return size.height }
        set { size.height = newValue }
    }
    
    
    @discardableResult func _addTo(_ superView: UIView) -> Self {
        superView.addSubview(self)
        return self
    }
    
    @discardableResult func _addChild(_ childView: UIView) -> Self {
        addSubview(childView)
        return self
    }
    
    @discardableResult func _bgColor(_ color: UIColor?) -> Self {
        backgroundColor = color
        return self
    }
    
    @discardableResult func _touchEnable(_ enable: Bool) -> Self {
        isUserInteractionEnabled = enable
        return self
    }
}
