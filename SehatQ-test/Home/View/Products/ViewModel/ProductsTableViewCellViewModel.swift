//
//  ProductsTableViewCellViewModel.swift
//  SehatQ-test
//
//  Created by user on 13/02/21.
//

import Foundation
protocol ProductsTableViewCellViewModelDelegate {
    func didFinishUpdatedData(title: String, imageString: String,loved: Int)
}

struct ProductsTableViewCellViewModel {
    private var products: [ProductPromo] = []
    var delegate: ProductsTableViewCellViewModelDelegate?
    
    
    init(data: [ProductPromo]) {
        self.products = data
    }
    
    func fetchProducts(index: Int) {
        let title = self.products[index].title
        let imageString = self.products[index].imageURL
        let loved = self.products[index].loved
        self.delegate?.didFinishUpdatedData(title: title, imageString: imageString, loved: loved)
    }
    
    

}
