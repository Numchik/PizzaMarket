//
//  ViewController.swift
//  PizzaMarket
//
//  Created by Максим Никитюк on 05.04.2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let storybord = UIStoryboard(name: "Tabbar", bundle: nil)
        let vc = storybord.instantiateViewController(identifier: "Tabbar")
        self.navigationController?.pushViewController(vc, animated: false)
        
    }


}

