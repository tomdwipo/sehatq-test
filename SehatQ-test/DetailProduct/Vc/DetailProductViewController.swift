//
//  DetailProductViewController.swift
//  SehatQ-test
//
//  Created by user on 14/02/21.
//

import UIKit
import Kingfisher

class DetailProductViewController: UIViewController {
    
    @IBOutlet var imageDetail: UIImageView!
    @IBOutlet var titleDetail: UILabel!
    @IBOutlet var loved: UIImageView!
    @IBOutlet var descriptionDetail: UILabel!
    @IBOutlet var priceDetail: UILabel!
    
    
    var viewModel: DetailProductViewModel = DetailProductViewModel()
    
    static func buidler(_ caller: UIViewController, product: ProductPromo) {
        let sb = UIStoryboard(name: "DetailProduct", bundle:nil)
        let vc = sb.instantiateViewController(withIdentifier: "DetailProductViewController") as! DetailProductViewController
        vc.viewModel = DetailProductViewModel(model: DetailProductModel(data: product))
        vc.modalPresentationStyle = .fullScreen
        caller.navigationController?.pushViewController(vc, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewModel.delegate = self
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.viewModel.fetchDetailProduct()
    }
}

extension DetailProductViewController: DetailProductViewModelDelegate {
    func didFinishFetchingData(model: DetailProductModel) {
        self.imageDetail.kf.setImage(with: URL(string: model.data.imageURL))
        self.titleDetail.text = model.data.title
        self.loved.image = model.data.loved == 1 ? UIImage(named: "ic_love_true") : UIImage(named: "ic_love_false")
        self.priceDetail.text = model.data.price
        self.descriptionDetail.text = model.data.productPromoDescription
    }
    
    
}
