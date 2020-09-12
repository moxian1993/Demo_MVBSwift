//
//  StringUtils.swift
//  MVBSwift
//
//  Created by Xian Mo on 2020/9/11.
//  Copyright © 2020 Mo. All rights reserved.
//

import Foundation

extension String {
    
    
    /// substring from index
    /// - Parameters:
    ///   - from: from: from
    ///   - include: default is true
    /// - Returns: string
    func utils_substring(from: Int, include: Bool = true) -> String {
        if from >= count {
            return ""
        }
        let start = index(startIndex, offsetBy: from)
        let sub = include ? self[start...] : self[start...].dropFirst()
        //  let sub = suffix(from: start)
        return String(sub)
    }

    
    /// substring to index
    /// - Parameters:
    ///   - to: to
    ///   - include: default is false
    /// - Returns: string
    func utils_substring(to: Int, include: Bool = false) -> String {
        if to >= count {
            return self
        }
        let end = index(startIndex, offsetBy: to)
        let sub = include ? self[...end] : self[..<end]
        // let sub = prefix(upTo: end) // 开区间
        return String(sub)
    }

    
    /// substring from left index to right index
    /// - Parameters:
    ///   - left: left index
    ///   - right: right index
    /// - Returns: string
    func utils_substring(left: Int = 0, right: Int = 0) -> String {
        if left >= count || right >= count || left + right >= count {
            return ""
        }
        let start = index(startIndex, offsetBy: left)
        let end = index(endIndex, offsetBy: -right)
        let sub = self[start..<end]
        // let sub = suffix(from: start).prefix(upTo: end)
        
        return String(sub)
    }
    
    
    /// 匹配两边字符，取中间内容 (开区间)
    /// - Parameters:
    ///   - left: left
    ///   - right: right
    /// - Returns: string
    func utils_substring(left: String = "", right: String = "") -> String {

        let start = left == "" ? startIndex : (firstIndex(of: Character(left)) ?? startIndex)
        let end = right == "" ? endIndex : (lastIndex(of: Character(right)) ?? endIndex)
        
        var sub = self[start..<end]
        // var sub = suffix(from: start).prefix(upTo: end)
        
        if start != startIndex {
            sub = sub.dropFirst()
        }
        else if start == startIndex, left != "" {
            if contains(Character(left)) {
                sub = sub.dropFirst()
            }
        }
        return String(sub)
    }
}

