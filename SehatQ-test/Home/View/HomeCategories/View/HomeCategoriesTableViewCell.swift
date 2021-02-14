//
//  CategoriesTableViewCell.swift
//  SehatQ-test
//
//  Created by user on 13/02/21.
//

import UIKit

class HomeCategoriesTableViewCell: UITableViewCell {
    
    @IBOutlet var collectionView: UICollectionView!
    
   static let identifier = "HomeCategoriesTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func registerCollectionView(vc: HomeViewController) {
        self.collectionView.dataSource = vc
        self.collectionView.register(UINib(nibName: "CategoriesCollectionCell", bundle: nil), forCellWithReuseIdentifier: "CategoriesCollectionCell")
        self.collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        self.collectionView.reloadData()
    }
  
}

