//
//  DetailProductViewModel.swift
//  SehatQ-test
//
//  Created by user on 14/02/21.
//

import Foundation

protocol DetailProductViewModelDelegate {
    func didFinishFetchingData(model: DetailProductModel)
}

struct DetailProductViewModel {
    private var model: DetailProductModel?
    var delegate: DetailProductViewModelDelegate?
    
    init(model: DetailProductModel? = nil) {
        self.model = model
    }
    
    func fetchDetailProduct(){
        guard let model = self.model else { return }
        self.delegate?.didFinishFetchingData(model: model)
    }
}
