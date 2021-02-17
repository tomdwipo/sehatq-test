//
//  HomeViewModel.swift
//  SehatQ-test
//
//  Created by user on 13/02/21.
//

import Foundation
import UIKit
protocol HomeViewModelDelegate {
    func didFinishFetchHome(data: Home)
    func didTappedToDetailProduct(data: ProductPromo)
}

struct HomeViewModel {
    private var home: Home?
    var delegate: HomeViewModelDelegate?
    
    func fetchAllData() {
        HTTPClient.shared.getHomeData { (result) in
            guard let result = result else { return }
            DispatchQueue.main.async {
               // self.delegate?.didFinishFetchHome(data: result)
            }
        }
    }
    
    mutating func fectchHome(data: Home)  {
        self.home = data
    }
        
    func setNumberOfSectionTableView() -> Int {
        return 2
    }
    
    func setNumberOfRowInSectionTableView(section: Int) -> Int {
        guard let home = self.home else { return 0 }
        return section == 0 ? 1 : home.productPromo.count
    }
    
    func setTableViewCellForRow(at indexPath: IndexPath, tableView: UITableView, vc: UIViewController) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: HomeCategoriesTableViewCell.identifier, for: indexPath) as! HomeCategoriesTableViewCell
            cell.registerCollectionView(vc: vc as! HomeViewController)
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: ProductsTableViewCell.identifier, for: indexPath) as! ProductsTableViewCell
            let productVM = ProductsTableViewCellViewModel(data: self.home?.productPromo ?? [])
            cell.registerViewModel(vm: productVM, index: indexPath.row)
            return cell
        }
    }
    
    
    func setNumberOfRowInSectionCollectionView() -> Int {
        guard let home = self.home else { return 0 }
        return home.category.count
    }
   
    func setCollectionViewCellForRow(at indexPath: IndexPath, collectionView: UICollectionView, vc: UIViewController) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoriesCollectionCell.identifier, for: indexPath) as! CategoriesCollectionCell
        let categoriesVM = CategoriesCollectionCellViewModel(with: self.home?.category ??  [])
        cell.configureViewModel(vm: categoriesVM, index: indexPath.row)
        return cell
    }
    
    func shareProductPromo()-> [ProductPromo] {
        guard let home = self.home else { return [] }
        return home.productPromo
    }
    
    func getTapRowTableviewCell(at indexPath : IndexPath) {
        if indexPath.section == 1 {
            let productPromoFilter = self.home?.productPromo[indexPath.row]
            guard let productPromo = productPromoFilter else { return }
            self.delegate?.didTappedToDetailProduct(data: productPromo)
        }
    }
}
