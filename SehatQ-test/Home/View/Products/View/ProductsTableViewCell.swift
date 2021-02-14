//
//  ProductsTableViewCell.swift
//  SehatQ-test
//
//  Created by user on 13/02/21.
//

import UIKit
import Kingfisher

class ProductsTableViewCell: UITableViewCell {

    static let identifier = "ProductsTableViewCell"
    @IBOutlet var productName : UILabel!
    @IBOutlet var productImage : UIImageView!
    @IBOutlet var productLiked : UIImageView!
    var viewModel: ProductsTableViewCellViewModel?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func registerViewModel(vm: ProductsTableViewCellViewModel?, index: Int) {
        self.viewModel = vm
        self.viewModel?.delegate = self
        self.viewModel?.fetchProducts(index: index)
    }
    
    
}

extension ProductsTableViewCell: ProductsTableViewCellViewModelDelegate {
    func didFinishUpdatedData(title: String, imageString: String, loved: Int) {
        productName.text = title
        productImage.kf.setImage(with: URL(string: imageString))
        productLiked.image = loved == 1 ? UIImage(named: "ic_love_true") : UIImage(named: "ic_love_false")
    }
    
    
}
