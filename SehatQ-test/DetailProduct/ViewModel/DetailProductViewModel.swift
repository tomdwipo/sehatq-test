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
    
    func purchaseProduct(){
        guard let model = self.model else { return }

        let productPromo = model.data
        let dataLists: [ProductPromo]? = Preference.getObjectDecodable(key: Constant.shared.PREFERENCE_PRODUCT)
        var productPromoList: [ProductPromo] = []
        
        if let data = dataLists {
            productPromoList = data
        }
        productPromoList.append(productPromo)
        Preference.saveObjectEncodable(dataModel: productPromoList, key: Constant.shared.PREFERENCE_PRODUCT)
    }
}
