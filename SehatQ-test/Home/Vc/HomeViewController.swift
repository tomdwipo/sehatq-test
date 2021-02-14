//
//  HomeViewController.swift
//  SehatQ-test
//
//  Created by user on 13/02/21.
//

import UIKit

class HomeViewController: BaseViewController {
    
    static func buidler(_ caller: UIViewController) {
        
        let sb = UIStoryboard(name: "Home", bundle:nil)
        let vc = sb.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        vc.modalPresentationStyle = .fullScreen
        let nav = UINavigationController(rootViewController: vc)
        nav.modalPresentationStyle = .fullScreen
        caller.addChild(nav)
        caller.view.addSubview(nav.view)
        vc.didMove(toParent: caller)
        
    }
    
    @IBOutlet var tableView: UITableView!
    
    var categoriesViewModel: CategoriesCollectionCellViewModel?
    var homeViewModel: HomeViewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setNavigation()
        self.registerTableView()
        
        self.homeViewModel.delegate = self
        self.homeViewModel.fetchAllData()
    }
    
    @objc func purchaseTapped(){
        print("test")
    }
    
    func setNavigation(){
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "ic_purchased"), style: .plain, target: self, action: #selector(purchaseTapped))
        setSearchBar(vc: self)
    }
    
   
    func registerTableView() {
        self.tableView.register(UINib(nibName: "HomeCategoriesTableViewCell", bundle: nil), forCellReuseIdentifier: "HomeCategoriesTableViewCell")
        self.tableView.register(UINib(nibName: "ProductsTableViewCell", bundle: nil), forCellReuseIdentifier: "ProductsTableViewCell")
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        self.tableView.rowHeight = UITableView.automaticDimension
        
    }
    
}

extension HomeViewController: UISearchBarDelegate {
    
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        SearchViewController.buidler(self, products: self.homeViewModel.shareProductPromo())
        return false
    }
    
}

extension HomeViewController: HomeViewModelDelegate {
    func didTappedToDetailProduct(data: ProductPromo) {
        DetailProductViewController.buidler(self, product: data)
        
    }
    
    func didFinishFetchHome(data: Home) {
        self.homeViewModel.fectchHome(data: data)
        self.tableView.reloadData()
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.homeViewModel.setNumberOfSectionTableView()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.homeViewModel.setNumberOfRowInSectionTableView(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return self.homeViewModel.setTableViewCellForRow(at: indexPath, tableView: tableView, vc: self)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.homeViewModel.getTapRowTableviewCell(at: indexPath)
    }
}


extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.homeViewModel.setNumberOfRowInSectionCollectionView()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return self.homeViewModel.setCollectionViewCellForRow(at: indexPath, collectionView: collectionView, vc: self)
    }
}
