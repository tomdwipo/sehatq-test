//
//  SearchTableViewCell.swift
//  SehatQ-test
//
//  Created by user on 13/02/21.
//

import UIKit
import Kingfisher
class CommonTableViewCell: UITableViewCell {

    static let identifier = "CommonTableViewCell"
    @IBOutlet var searchImage: UIImageView!
    @IBOutlet var searchTitle: UILabel!
    @IBOutlet var searchPrice: UILabel!
    

    func didFinishFetchingData(title: String, price: String, image: String) {
        self.searchTitle.text = title
        self.searchPrice.text = price
        self.searchImage.kf.setImage(with: URL(string: image))
    }
    
}

