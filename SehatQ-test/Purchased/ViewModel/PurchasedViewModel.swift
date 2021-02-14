//
//  PurchasedViewModel.swift
//  SehatQ-test
//
//  Created by user on 14/02/21.
//

import Foundation
import UIKit

protocol PurchasedViewModelDelegate {
    func didFinishFetchSearchData(models: [CommonModel])
    func didTableCellTapped(data: ProductPromo)
}

struct PurchasedViewModel {
    private var model : [CommonModel] = []
    var delegate: PurchasedViewModelDelegate?
    var searchDelegate: PurchasedViewModelDelegate?
     func fetchPurchasedData(){
        let dataLists: [ProductPromo]? = Preference.getObjectDecodable(key: Constant.shared.PREFERENCE_PRODUCT)
        guard let data = dataLists else { return }
        let models: [CommonModel] = data.map{ CommonModel(id: $0.id,image: $0.imageURL, title: $0.title, price: $0.price) }
        DispatchQueue.main.async {
            self.delegate?.didFinishFetchSearchData(models: models)
        }
    }
    
    mutating func fetchData(models : [CommonModel]){
        self.model = models
    }
    
    func setTableViewRowCountCell() -> Int {
        return self.model.count
    }
    
    
    func setTableViewCell(tableView: UITableView,cellForRowAt indexPath: IndexPath)-> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: CommonTableViewCell.identifier, for: indexPath) as! CommonTableViewCell
        cell.didFinishFetchingData(title:self.model[indexPath.row].title, price: self.model[indexPath.row].price, image: self.model[indexPath.row].image)
        return cell
    }
    
    func getTableCellTap(at index: Int){
        let home: Home? = Preference.getObjectDecodable(key: Constant.shared.PREFERENCE_HOME)
        guard let data = home else { return }
        let id = self.model[index].id
        let productPromoFilter = data.productPromo.filter{ $0.id ==  id }.first
        guard let productPromo = productPromoFilter else { return }
        self.delegate?.didTableCellTapped(data: productPromo)
    }
}
