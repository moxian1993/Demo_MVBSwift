//
//  SetUtils.swift
//  MVBSwift
//
//  Created by Xian Mo on 2020/9/14.
//  Copyright © 2020 Mo. All rights reserved.
//

import Foundation

extension Array {
    
    /// model排序 (闭包中 obj as! model 即可使用属性)
    /// 或 arr.sorted_oc (by: {($0 as! model).pid < ($1 as! model).pid})
    /// - Parameter by: by
    /// - Returns: [model]
    func sorted_oc(by :(Any, Any) -> Bool) -> [Any] {
        guard count > 1 else {
            return self
        }
        
        var arr = self
        //Bubble Sort
        for i in 0..<count-1 {
            for j in 0..<count-1-i {
                let correct = by(arr[j], arr[j+1])
                if !correct {
                    (arr[j], arr[j+1]) = (arr[j+1], arr[j])
                } else {
                    continue
                }
            }
        }
        return arr
    }
}
