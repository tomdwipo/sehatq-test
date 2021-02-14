//
//  CategoriesTableViewCellViewModel.swift
//  SehatQ-test
//
//  Created by user on 13/02/21.
//

import Foundation

protocol CategoriesCollectionCellViewModelDelegate {
    func didFinishFetchingData(categoryName: String, categoryImage: String)
}

struct CategoriesCollectionCellViewModel {
    private var categories: [Categorys] = []
    var delegate: CategoriesCollectionCellViewModelDelegate?
    
    init(with model: [Categorys]) {
        self.categories = model
    }
    
    func fetchCategories(index: Int) {
        let categoryName = self.categories[index].name
        let categoryImage = self.categories[index].imageURL
        self.delegate?.didFinishFetchingData(categoryName: categoryName, categoryImage: categoryImage)

    }
}
