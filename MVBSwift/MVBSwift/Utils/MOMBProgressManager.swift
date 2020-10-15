//
//  MOMBProgressManager.swift
//  MVBSwift
//
//  Created by Xian Mo on 2020/10/13.
//  Copyright © 2020 Mo. All rights reserved.
//

import UIKit
import MBProgressHUD

private let hud_defaultDelay = 1.0
private let hud_tapToDismiss = true

enum kMBProgressType {
    case Text // 仅显示标签
    case CustomerView // 自定义的view
    case Indeterminate // 菊花
    case Graph // 用图表显示进度：饼型、水平进度条、圆环进度条
}

class MOMBProgressManager: NSObject {
    
    typealias completed = (() -> Void)?
    
    // loading
    class func showLoading() {
        show(type: .Indeterminate, "loading...")
    }
    
    class func show(type: kMBProgressType = .Text, _ text: String? = nil, image: String? = nil, on view: UIView? = nil, duration: TimeInterval = hud_defaultDelay, completed: completed = nil) {
        
        let hud = MBProgressHUD()
        (view ?? UIApplication.shared.windows.last!).addSubview(hud)
        
        if hud_tapToDismiss {
            let tap = UITapGestureRecognizer(target: self, action: #selector(self.tap(_:)))
            hud.bezelView.addGestureRecognizer(tap)
        }
        
        // mode配置
        setupHUD(hud: hud, type: type, image: (image == nil ? nil : UIImage(named: image!)))
        // 整体属性配置
        setupConfig(hud: hud)
        
        if text != nil {
            hud.label.text = text
        }
        
        if completed != nil {
            hud.completionBlock = completed
        }
        hud.show(animated: true)
        hud.hide(animated: true, afterDelay: duration)
    }
    
    @objc class func tap(_ sender: UITapGestureRecognizer) {
        if let view = sender.view!.superview as? MBProgressHUD  {
            view.hide(animated: true)
        }
    }
    
    private class func setupHUD(hud: MBProgressHUD, type: kMBProgressType, image: UIImage?) {
        /**
         MBProgressHUDModeText:仅显示标签
         MBProgressHUDModeCustomView:自定义的view
         MBProgressHUDModeIndeterminate:使用UIActivityIndi​​catorView显示进度。这是菊花默认值。
         MBProgressHUDModeDeterminate:使用圆形的饼图来显示进度。
         MBProgressHUDModeDeterminateHorizontalBar:使用水平进度条显示进度.
         MBProgressHUDModeAnnularDeterminate:使用圆环进度视图显示进度
         */
        var mode: MBProgressHUDMode
        
        switch type {
        case .Text:
            mode = .text
        case .CustomerView:
            mode = .customView
            if image != nil {
                hud.customView = UIImageView(image: image)
            }
        case .Indeterminate:
            mode = .indeterminate
        case .Graph:
            /**
             MBProgressHUDModeDeterminate:使用圆形的饼图来显示进度。
             MBProgressHUDModeDeterminateHorizontalBar:使用水平进度条显示进度.
             MBProgressHUDModeAnnularDeterminate:使用圆环进度视图显示进度
             */
            mode = .annularDeterminate
        }
        hud.mode = mode
    }
    
    private class func setupConfig(hud: MBProgressHUD) {
        // 1.隐藏时候从父控件中移除
        hud.removeFromSuperViewOnHide = true
        
        // 2.动画效果
    //    hud.animationType = MBProgressHUDAnimationZoom;
        
        // 3.背景效果
        /**
         MBProgressHUDBackgroundStyleSolidColor:实心颜色,可以设置半透明颜色
         MBProgressHUDBackgroundStyleBlur: 背景毛玻璃效果，不会有半透明效果
         */
    //    hud.backgroundView.style = MBProgressHUDBackgroundStyleSolidColor;
    //    hud.backgroundView.color = [UIColor.greenColor colorWithAlphaComponent:0.5];
        // hud板
        hud.bezelView.style = .solidColor;
        hud.bezelView.color = UIColor.gray.withAlphaComponent(0.5)

        // 4.设置背景框的圆角值
    //    hud.bezelView.layer.cornerRadius = 20.0;

        // 5.indictor 和 label 颜色
    //    hud.contentColor = UIColor.blackColor;
        
        // 6.设置label 及 detailLabel
    //    hud.label.textColor = UIColor.blueColor;
    //    hud.label.font = [UIFont systemFontOfSize:13];
    //    hud.detailsLabel.textColor = UIColor.grayColor;
    //    hud.detailsLabel.font = [UIFont systemFontOfSize:13];

        // 7.设置中心点的偏移量
    //    hud.offset = CGPointMake(-80, -100);

        // 8.设置各个元素距离矩形边框的距离
    //    hud.margin = 20;

        // 9.背景框的最小值，默认为0(无最小值)
    //    hud.minSize = CGSizeMake(100, 100);

        //10.是否强制背景框宽高相等
    //    hud.square = YES;
        // 11.设置最短显示时间 避免显示后立刻被隐藏，默认是 0
    //    hud.minShowTime = 3;
    }
    
    class func dismiss(_ view: UIView? = nil) {
        let view = view == nil ? UIApplication.shared.windows.last! : view!
        MBProgressHUD.hide(for: view, animated: true)
    }
    
    
}


