//
//  PurchasedViewController.swift
//  SehatQ-test
//
//  Created by user on 14/02/21.
//

import UIKit

class PurchasedViewController: UIViewController {
    @IBOutlet var tableView: UITableView!
    var viewModel: PurchasedViewModel = PurchasedViewModel()

    static func builder(_ caller: UIViewController) {
        let sb = UIStoryboard(name: "Purchased", bundle:nil)
        let vc = sb.instantiateViewController(withIdentifier: "PurchasedViewController") as! PurchasedViewController
        vc.modalPresentationStyle = .fullScreen
        caller.navigationController?.pushViewController(vc, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Purchased History"
        registerTableview()
        self.viewModel.delegate = self
        self.viewModel.fetchPurchasedData()
        
        
        // Do any additional setup after loading the view.
    }
    
  
    
    func registerTableview()  {
        self.tableView.register(UINib(nibName: CommonTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: CommonTableViewCell.identifier)
        self.tableView.dataSource = self
        self.tableView.delegate = self

        self.tableView.rowHeight = UITableView.automaticDimension
    }


}


extension PurchasedViewController: PurchasedViewModelDelegate {
    func didTableCellTapped(data: ProductPromo) {
        DetailProductViewController.buidler(self, product: data)
    }
    
    func didFinishFetchSearchData(models: [CommonModel]) {
        self.viewModel.fetchData(models: models)
        self.tableView.reloadData()
    }
}

extension PurchasedViewController: UITableViewDataSource , UITableViewDelegate{
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
