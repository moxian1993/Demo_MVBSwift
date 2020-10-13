//
//  MOHomeController.swift
//  MVBSwift
//
//  Created by Xian Mo on 2020/9/15.
//  Copyright © 2020 Mo. All rights reserved.
//

import UIKit

class MOHomeController: MOBaseController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.rightBarButtonItem = popItem
        
        // Do any additional setup after loading the view.
        
        //        let api = "https://api.apiopen.top/recommendPoetry"
        //        request(urlStr: api) { (success, obj) in
        //            if success {
        //                print("data:\(obj)")
        //            } else {
        //                print("error:\(obj)")
        //            }
        //        }
        
    }
    
    @objc private func popBtnDidClicked() {
        print(#function)
    }

    /* navi pop button */
    lazy var popItem: UIBarButtonItem = {
        let btn = UIButton(type: .custom)._img("navigationbar_pop", for: .normal)._img("navigationbar_pop_highlighted", for: .highlighted)
        btn.addTarget(self, action: #selector(self.popBtnDidClicked), for: .touchUpInside)
        return UIBarButtonItem(customView: btn)
    }()


    func request(urlStr: String, compeletd:@escaping (Bool, Any) -> Void) {
        guard let url = URL(string: urlStr) else {
            return
        }
        DispatchQueue.global().async {
            URLSession.shared.dataTask(with: url) { (data, _, error) in
                if error != nil {
                    DispatchQueue.main.async {
                        compeletd(false, error!)
                    }
                } else {
                    let json = try? JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
                    DispatchQueue.main.async {
                        compeletd(true, json!)
                    }
                }
            }.resume()
        }
    }
}
