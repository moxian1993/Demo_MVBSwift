//
//  MOBaseController.swift
//  MVBSwift
//
//  Created by Xian Mo on 2020/10/2.
//  Copyright © 2020 Mo. All rights reserved.
//

import UIKit

class MOBaseController: MOViewController {
    
    override func loadView() {
        setupVisitorView()
    }
    
    private func setupVisitorView() {
        let visitorView = MOVisitorView.init()
        view = visitorView
        visitorView.delegate = self
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
    }
    
}


extension MOBaseController: MOVisitorProtocol {
    func visitorViewToSignOn() {
        print(#function)
    }
    
    func visitorViewToSignIn() {
        MOMBProgressManager.show("coming soon..")
    }
}
