//
//  MOTabBar.swift
//  MVBSwift
//
//  Created by Xian Mo on 2020/9/15.
//  Copyright © 2020 Mo. All rights reserved.
//

import UIKit

class MOTabBar: UITabBar {
    
    var itemW: CGFloat = Screen_Width / 5.0
    
    override func layoutSubviews() {
        super.layoutSubviews()
        var num: CGFloat = 0
        for subview in subviews {
            if subview.isKind(of: NSClassFromString("UITabBarButton")!) {
                subview.frame = CGRect(x: num*itemW, y: 0, width: itemW, height: subview.frame.size.height)
                num += 1
                if num == 2 {
                    num += 1
                }
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let btn = UIButton(type: .custom)._img("tabbar_compose_icon_add", for: .normal)
            ._img("tabbar_compose_icon_add_highlighted", for: .highlighted)
            ._bgImg("tabbar_compose_button", for: .normal)
            ._bgImg("tabbar_compose_button_highlighted", for: .highlighted)._addTo(self)._sizeToFit()
        btn.frame = CGRect(x: itemW*2, y: 0, width: itemW, height: btn.height)
        btn.addTarget(self, action: #selector(self.clicked), for: .touchUpInside)
    }
    
    @objc func clicked() {
        print(#function)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
