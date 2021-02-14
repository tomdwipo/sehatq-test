//
//  LoginViewController.swift
//  SehatQ-test
//
//  Created by user on 14/02/21.
//

import UIKit
import GoogleSignIn
import FBSDKLoginKit
class LoginViewController: BaseViewController {
    
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
      setupFbLoginBtn()
        // Do any additional setup after loading the view.
    }
    
    
    func setupFbLoginBtn(){
        let loginButton = FBLoginButton()
        loginButton.frame = CGRect(x: 30, y: self.googleSignIn.frame.maxY, width: self.view.frame.width-60, height: self.googleSignIn.frame.height-5)
        view.addSubview(loginButton)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let token = AccessToken.current, !token.isExpired {
        // User is logged in, do work such as go to next view controller.
        
        } 
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
