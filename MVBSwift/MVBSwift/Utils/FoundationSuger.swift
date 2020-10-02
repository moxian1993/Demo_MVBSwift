//
//  FoundationSuger.swift
//  MVBSwift
//
//  Created by Xian Mo on 2020/9/16.
//  Copyright © 2020 Mo. All rights reserved.
//

import Foundation
import UIKit

//MARK: - Cupcake
func _CGFloat(_ any: Any?) -> CGFloat {
    if any == nil { return 0 }
    
    if let result = _CGFloatOptional(any) {
        return result
    } else {
        assert(false, "invalid float")
        return 0
    }
}


func _CGFloatOptional(_ any: Any?) -> CGFloat? {
    
    if any == nil {
        return nil
        
    } else {
        if let value = any as? CGFloat { return value }
        if let value = any as? String { let f = Float(value); return f != nil ? CGFloat(f!) : nil }
        
        if let value = any as? Int { return CGFloat(value) }
        if let value = any as? UInt { return CGFloat(value) }
        
        if let value = any as? Double { return CGFloat(value) }
        if let value = any as? Float { return CGFloat(value) }
        
        if let value = any as? Int8 { return CGFloat(value) }
        if let value = any as? UInt8 { return CGFloat(value) }
        if let value = any as? Int16 { return CGFloat(value) }
        if let value = any as? UInt16 { return CGFloat(value) }
        if let value = any as? Int32 { return CGFloat(value) }
        if let value = any as? UInt32 { return CGFloat(value) }
        if let value = any as? Int64 { return CGFloat(value) }
        if let value = any as? UInt64 { return CGFloat(value) }
        
        return nil
    }
}

