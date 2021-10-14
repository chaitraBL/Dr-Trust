//
//  CartItemsViewController.swift
//  Gluco App
//
//  Created by Anjali on 4/6/21.
//

import UIKit

class CartItemsViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    
    
    var shopImage = ["App-Icon-2","App-Icon-2","App-Icon-2"]
    var discount = ["save 25%","save 25%","save 25%"]
    var name = ["Dr Trust USA Smart Talking Automatic Digital Bp Machine Blood","Dr Trust USA Smart Talking Automatic Digital Bp Machine Blood","Dr Trust USA Smart Talking Automatic Digital Bp Machine Blood"]
    var price = ["4000","4000","4000"]
    var halfPrice = ["2000","2000","2000"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return discount.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cartItems", for: indexPath) as! ShopTableViewCell
        cell.cartImg.image = UIImage(named: shopImage[indexPath.row])
        cell.cartDiscount.text = discount[indexPath.row]
        cell.actualPrice.text = price[indexPath.row]
        cell.cartPrice.text = halfPrice[indexPath.row]
        cell.name.text = name[indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

   

}
