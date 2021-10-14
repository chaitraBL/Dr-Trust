//
//  ShopViewController.swift
//  Gluco App
//
//  Created by Anjali on 4/6/21.
//

import UIKit

class ShopViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var shopImage = ["App-Icon-2","App-Icon-2","App-Icon-2"]
    var discount = ["save 25%","save 25%","save 25%"]
    var name = ["Dr Trust USA Smart Talking Automatic Digital Bp Machine Blood","Dr Trust USA Smart Talking Automatic Digital Bp Machine Blood","Dr Trust USA Smart Talking Automatic Digital Bp Machine Blood"]
    var price = ["4000","4000","4000"]
    var halfPrice = ["2000","2000","2000"]
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return discount.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShopCV", for: indexPath) as! ShopCollectionViewCell
        cell.shopImage.image = UIImage(named: shopImage[indexPath.row])
        cell.nameLabel.text = name[indexPath.row]
        cell.percentLabel.text = discount[indexPath.row]
        cell.priceLabel.text = price[indexPath.row]
        cell.discountLabel.text = halfPrice[indexPath.row]
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 350)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

   

}
