//
//  LoginViewController.swift
//  SehatQ-test
//
//  Created by user on 14/02/21.
//

import UIKit
import GoogleSignIn


class LoginViewController: BaseViewController {
    let mySpecialNotificationKey = "com.andrewcbancroft.specialNotificationKey"
    
    @IBOutlet weak var googleSignIn: GIDSignInButton!
   
    static func builder(_ caller: UIViewController) {
        let sb = UIStoryboard(name: "Login", bundle:nil)
        let vc = sb.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        vc.modalPresentationStyle = .fullScreen
        caller.present(vc, animated: false, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance()?.presentingViewController = self
        NotificationCenter.default.addObserver(self, selector: #selector(navigateToDashboard), name: Constant.shared.changePage, object: nil)
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func signInTapped(_ sender: Any) {
        NotificationCenter.default.post(name: Constant.shared.changePage, object: self)
    }
    
    @objc func navigateToDashboard() {
        DispatchQueue.main.async {
            DashboardRouter.shared.builderDashboard(caller: self)
            
        }
    }
    
}
