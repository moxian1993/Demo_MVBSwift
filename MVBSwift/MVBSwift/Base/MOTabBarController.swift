//
//  MOTabBarController.swift
//  MVBSwift
//
//  Created by Xian Mo on 2020/9/15.
//  Copyright © 2020 Mo. All rights reserved.
//

import UIKit

class MOTabBarController: UITabBarController {
    
    init() {
        super.init(nibName: nil, bundle: nil)
        setup()
        setValue(MOTabBar(), forKey: "tabBar")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        ["Home", "Message", "Discover", "Profile"].forEach({ (name) in
            let proj = Bundle.main.infoDictionary?["CFBundleExecutable"] as? String ?? ""
            let clz = NSClassFromString("\(proj)"+".MO\(name)Controller") as! UIViewController.Type
            let vc = clz.init()
            let navi = MONaviController.init(rootViewController: vc)
            
            let imgName = "tabbar_\(name.lowercased())"
            navi.tabBarItem.image = UIImage(named: imgName)?.withRenderingMode(.alwaysOriginal)
            navi.tabBarItem.selectedImage = UIImage(named: imgName + "_selected")?.withRenderingMode(.alwaysOriginal)
            navi.tabBarItem.title = name
            navi.tabBarItem.setTitleTextAttributes([.foregroundColor: UIColor.orange], for: .normal)
            addChild(navi)
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
