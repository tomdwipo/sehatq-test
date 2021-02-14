//
//  SearchViewController.swift
//  SehatQ-test
//
//  Created by user on 13/02/21.
//

import UIKit

class SearchViewController: BaseViewController {

    @IBOutlet var tableView: UITableView!
    var viewModel: SearchViewModel = SearchViewModel()
    
    static func buidler(_ caller: UIViewController, products: [ProductPromo]) {
        let sb = UIStoryboard(name: "Search", bundle:nil)
        let vc = sb.instantiateViewController(withIdentifier: "SearchViewController") as! SearchViewController
        vc.modalPresentationStyle = .fullScreen
        caller.navigationController?.pushViewController(vc, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel.searchDelegate = self
        setSearchBar(vc: self)
        self.searchBar.becomeFirstResponder()
        self.registerTableview()
        // Do any additional setup after loading the view.
    }
    
    func registerTableview()  {
        self.tableView.register(UINib(nibName: CommonTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: CommonTableViewCell.identifier)
        self.tableView.dataSource = self
        self.tableView.delegate = self

        self.tableView.rowHeight = UITableView.automaticDimension
    }

}

extension SearchViewController: SearchViewModelDelegate {
    func didTableCellTapped(data: ProductPromo) {
        DetailProductViewController.buidler(self, product: data)
    }
    
    func didFinishFetchSearchData(models: [SearchModel]) {
        self.viewModel.fetchData(models: models)
        self.tableView.reloadData()
    }
}

extension SearchViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.viewModel.fetchSearchData(textDidChange: searchText)
    }
}


extension SearchViewController: UITableViewDataSource , UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.setTableViewRowCountCell()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return self.viewModel.setTableViewCell(tableView: tableView, cellForRowAt: indexPath)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.viewModel.getTableCellTap(at: indexPath.row)
    }
    
}
