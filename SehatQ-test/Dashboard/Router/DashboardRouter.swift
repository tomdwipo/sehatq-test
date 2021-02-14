//
//  DashboardRouter.swift
//  SehatQ-test
//
//  Created by user on 14/02/21.
//

import Foundation
import UIKit

struct DashboardRouter {
    static let shared = DashboardRouter()
    
    func builderDashboard(caller: UIViewController){
        let sb = UIStoryboard(name: "Dashboard", bundle:nil)
        let vc = sb.instantiateViewController(withIdentifier: "tabbar") as! UITabBarController
        vc.modalPresentationStyle = .fullScreen
        caller.present(vc, animated: false, completion: nil)
        
    }
}
