//
//  BaseViewController.swift
//  SehatQ-test
//
//  Created by user on 14/02/21.
//

import Foundation
import UIKit

class BaseViewController: UIViewController {
    lazy var searchBar:UISearchBar = UISearchBar(frame: CGRect(x:0, y:0, width:self.view.frame.width-80, height:20))

    func setSearchBar(vc: UIViewController)  {
        searchBar.placeholder = "Search"
        let rightBarButtonItem = UIBarButtonItem(customView:searchBar)
        self.navigationItem.rightBarButtonItem = rightBarButtonItem
        searchBar.delegate = vc as? UISearchBarDelegate
    }
    
    func builderBackButtonOnNavigation(){
        let backItem = UIBarButtonItem()
        backItem.title = " "
        navigationItem.backBarButtonItem = backItem
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        builderBackButtonOnNavigation()
    }
    
}
