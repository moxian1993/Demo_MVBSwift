//
//  MOVisitorView.swift
//  MVBSwift
//
//  Created by Xian Mo on 2020/10/2.
//  Copyright © 2020 Mo. All rights reserved.
//

import UIKit
import SnapKit

@objc protocol MOVisitorProtocol: NSObjectProtocol {
    @objc optional func visitorViewToSignIn()
    @objc optional func visitorViewToSignOn()
}



class MOVisitorView: UIView {
    
    weak var delegate: MOVisitorProtocol?
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    private func setup() {
        backgroundColor = UIColor(white: 237.0/255.0, alpha: 1.0)
        
        circleImgView._addTo(self).snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-80)
        }
        
        coverImgView._addTo(self).snp.makeConstraints { (make) in
            make.center.equalTo(circleImgView)
        }
        
        centerImgView._addTo(self).snp.makeConstraints { (make) in
            make.center.equalTo(circleImgView)
        }
        
        tipLab._addTo(self).snp.makeConstraints { (make) in
            make.top.equalTo(circleImgView.snp.bottom).offset(20)
            make.centerX.equalTo(circleImgView)
        }
        /*
         设置文字换行,不要使用设置左右边距来限制宽度,也不要直接设置约束宽度:在计算非常精确的文本自动换行的时候 会导致高度计算的不准确
         */
        tipLab.preferredMaxLayoutWidth = 250
        
        loginBtn._addTo(self).snp.makeConstraints { (make) in
            make.left.equalTo(tipLab)
            make.top.equalTo(tipLab.snp.bottom).offset(20)
            make.width.equalTo(100)
        }
        
        registerBtn._addTo(self).snp.makeConstraints { (make) in
            make.right.equalTo(tipLab)
            make.top.equalTo(tipLab.snp.bottom).offset(20)
            make.width.equalTo(loginBtn)
        }

        loginBtn.addTarget(self, action: #selector(self.loginBtnDidClicked(_ :)), for: .touchUpInside)
        registerBtn.addTarget(self, action: #selector(self.registerBtnDidClicked(_ :)), for: .touchUpInside)
    }
    
    @objc private func loginBtnDidClicked(_ sender: UIButton) {
        delegate?.visitorViewToSignOn?()
    }
    
    @objc private func registerBtnDidClicked(_ sender: UIButton) {
        delegate?.visitorViewToSignIn?()
    }
    
    
    lazy var circleImgView: UIImageView = {
        let view = UIImageView(image: UIImage(named: "visitordiscover_feed_image_smallicon"))
        return view
    }()
    
    lazy var coverImgView: UIImageView = {
        let view = UIImageView(image: UIImage(named: "visitordiscover_feed_mask_smallicon"))
        return view
    }()
    
    lazy var centerImgView: UIImageView = {
        let view = UIImageView(image: UIImage(named: "visitordiscover_feed_image_house"))
        return view
    }()
    
    lazy var tipLab: UILabel = {
        let lab = UILabel()
        lab.text = "关注一些人，回到这里看看有什么惊喜"
        lab.font = UIFont.systemFont(ofSize: 15)
        lab.textColor = UIColor.darkGray
        lab.textAlignment = NSTextAlignment.center
        lab.numberOfLines = 0
        return lab
    }()
    
    lazy var loginBtn: UIButton = {
        let btn = UIButton(type: .custom)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        btn.setTitle("登录", for: .normal)
        btn.setTitleColor(UIColor.darkGray, for: .normal)
        btn.setBackgroundImage(UIImage(named: "common_button_white"), for: .normal)
        return btn
    }()
    
    lazy var registerBtn: UIButton = {
        let btn = UIButton(type: .custom)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        btn.setTitle("注册", for: .normal)
        btn.setTitleColor(UIColor.orange, for: .normal)
        btn.setBackgroundImage(UIImage(named: "common_button_white"), for: .normal)
        return btn
    }()
    
}
