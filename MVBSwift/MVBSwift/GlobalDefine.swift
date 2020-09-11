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


//MARK: - resource
internal func Img(_ name: String) -> UIImage {
    return UIImage(named: name)!
}

//internal func LocalizedString(_ string: String) -> String {
//    return FtSelectLanguageManager.bundle().localizedString(forKey: string, value: nil, table: "Localizable")
//}

//MARK: - adaptor
let NavBar_Height: CGFloat = 64.0
let TabBar_Hieght: CGFloat = 49.0

let iPhone6_Width: CGFloat = 375.0
let iPhone6_Height: CGFloat = 667.0


let Screen_Width = { () -> CGFloat in
    return UIScreen.main.bounds.size.width
}()

let Screen_Height = { () -> CGFloat in
    return UIScreen.main.bounds.size.height
}()

let StatusBar_Hieght = { () -> CGFloat in
    return UIApplication.shared.statusBarFrame.size.height
}()

let Screen_Scale_Horizontal = { () -> CGFloat in
    return Screen_Width / iPhone6_Width
}()

let Screen_Scale_Vertical = { () -> CGFloat in
    return Screen_Height / iPhone6_Height
}()




//MARK: - color
//internal func HEXCOLOR(_ hex: UInt32) -> UIColor {
//    return UIColor.m_color(withHex: hex)
//}
//
//internal func RANDOMCOLOR() -> UIColor {
//    return UIColor.m_random()
//}
//
//internal func RBGCOLOR(R r: UInt8, G g: UInt8, B b: UInt8) -> UIColor {
//    return UIColor.m_color(withRed: r, green: g, blue: b)
//}


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

