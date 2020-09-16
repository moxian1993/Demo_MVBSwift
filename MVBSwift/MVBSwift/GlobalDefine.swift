//
//  GlobalDefine.swift
//  MTalk
//
//  Created by Mo on 2017/6/2.
//  Copyright © 2017年 Mo. All rights reserved.
//

import Foundation
import UIKit

//MARK: - print
///全局函数 T是泛型 传入不同的参数
func MLog<T>(_ message: T, file: String = #file, function: String = #function, line: Int = #line){
    #if DEBUG
    let file = (file as NSString).lastPathComponent.split(separator: ".").first!;
    print("\(file) \(function) [Line: \(line)]: \(message)");
    #endif
}


//MARK: - adaptor
let iPhone6_Width: CGFloat = 375.0
let iPhone6_Height: CGFloat = 667.0

let Screen_Bounds: CGRect = UIScreen.main.bounds
let Screen_Width: CGFloat = Screen_Bounds.size.width
let Screen_Height: CGFloat = Screen_Bounds.size.height

let StatusBar_Hieght: CGFloat = {
    if #available(iOS 13.0, *) {
        let statusBarManager = UIApplication.shared.windows.first?.windowScene?.statusBarManager
        return statusBarManager!.statusBarFrame.size.height
    } else {
        return UIApplication.shared.statusBarFrame.size.height
    }
}()


let AdaptScale: CGFloat = iPhone6_Width / Screen_Width

let AdaptSafeTop: CGFloat = StatusBar_Hieght

let AdaptSafeBottom = { () -> CGFloat in
    guard #available(iOS 11.0, *) else {
        return 0.0
    }
    if #available(iOS 13.0, *), let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate {
        return (sceneDelegate as! SceneDelegate).window?.safeAreaInsets.bottom ?? 0.0
    }
    return UIApplication.shared.delegate?.window??.safeAreaInsets.bottom ?? 0.0
} ()


func findWindow() -> UIWindow? {
    if #available(iOS 13.0, *) {
        /* 方法一 */
        return UIApplication.shared.windows.filter {$0.isKeyWindow}.first
        /* 方法二 */
        // return UIApplication.shared.windows.first {$0.isKeyWindow}
        /* 方法三 */
        /*
        let keyWindow = UIApplication.shared.connectedScenes
            .filter({$0.activationState == .foregroundActive})
            .map({$0 as? UIWindowScene})
            .compactMap({$0})
            .first?.windows
            .filter({$0.isKeyWindow}).first
        return keyWindow
        */
    } else {
        return UIApplication.shared.keyWindow
    }
}


//MARK: - font
internal func FONT(_ size: CGFloat) -> UIFont {
    return UIFont(name: "PingFangSC-Regular", size: size)!
}

internal func FONTThin(_ size: CGFloat) -> UIFont {
    return UIFont(name: "PingFangSC-Thin", size: size)!
}

internal func FONTBold(_ size: CGFloat) -> UIFont {
    return UIFont(name: "PingFangSC-Semibold", size: size)!
}

internal func FONTMedium(_ size: CGFloat) -> UIFont {
    return UIFont(name: "PingFangSC-Medium", size: size)!
}

