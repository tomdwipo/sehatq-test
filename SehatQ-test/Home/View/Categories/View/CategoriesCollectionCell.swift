//
//  CategoriesCollectionCell.swift
//  SehatQ-test
//
//  Created by user on 13/02/21.
//

import UIKit
import Kingfisher

class CategoriesCollectionCell: UICollectionViewCell {
    static let identifier = "CategoriesCollectionCell"
    @IBOutlet var categoryName: UILabel!
    @IBOutlet var categoryImage: UIImageView!
    var viewModel: CategoriesCollectionCellViewModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    func configureViewModel(vm: CategoriesCollectionCellViewModel?, index: Int) {
        self.viewModel = vm
        self.viewModel?.delegate = self
        self.viewModel?.fetchCategories(index: index)
    }
}

extension CategoriesCollectionCell: CategoriesCollectionCellViewModelDelegate {
    func didFinishFetchingData(categoryName: String, categoryImage: String) {
        self.categoryName.text = categoryName
        self.categoryImage.kf.setImage(with: URL(string: categoryImage))
    }
    
    
}
