//
//  MOHomeController.swift
//  MVBSwift
//
//  Created by Xian Mo on 2020/9/15.
//  Copyright © 2020 Mo. All rights reserved.
//

import UIKit

class MOHomeController: MOViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
