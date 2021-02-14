//
//  ViewModel.swift
//  SehatQ-test
//
//  Created by user on 13/02/21.
//

import Foundation
import UIKit

protocol SearchViewModelDelegate {
    func didFinishFetchSearchData(models: [SearchModel])
    func didTableCellTapped(data: ProductPromo)
}

struct SearchViewModel {
    private var model : [SearchModel] = []
   
    var searchDelegate: SearchViewModelDelegate?
     func fetchSearchData(textDidChange searchText: String){
        let home: Home? = Preference.getObjectDecodable(key: Constant.shared.PREFERENCE_HOME)
        guard let data = home else { return }
        let models: [SearchModel] = data.productPromo.map{ SearchModel(id: $0.id,image: $0.imageURL, title: $0.title, price: $0.price) }
        DispatchQueue.main.async {
            self.searchDelegate?.didFinishFetchSearchData(models: searchText.isEmpty ?  [] : models)
        }
    }
    
    mutating func fetchData(models : [SearchModel]){
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
        self.searchDelegate?.didTableCellTapped(data: productPromo)
    }
}
