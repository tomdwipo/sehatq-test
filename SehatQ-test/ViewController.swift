//
//  ViewController.swift
//  SehatQ-test
//
//  Created by user on 12/02/21.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        DashboardRouter.shared.builderDashboard(caller: self)
    }
  
}

