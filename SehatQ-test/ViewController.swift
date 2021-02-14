//
//  ViewController.swift
//  SehatQ-test
//
//  Created by user on 12/02/21.
//

import UIKit
import GoogleSignIn

class ViewController: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance()?.restorePreviousSignIn()
    }
}



extension ViewController:  GIDSignInDelegate {
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let error = error {
           if (error as NSError).code == GIDSignInErrorCode.hasNoAuthInKeychain.rawValue {
             print("The user has not signed in before or they have since signed out.")
            Preference.remove(key: "auth")

            DispatchQueue.main.async {
                LoginViewController.builder(self)
            }
           } else {
             print("\(error.localizedDescription)")
           }
           return
         }
        NotificationCenter.default.post(name: Constant.shared.changePage, object: self)
        DispatchQueue.main.async {
            DashboardRouter.shared.builderDashboard(caller: self)
        }
    }
    
    
}
