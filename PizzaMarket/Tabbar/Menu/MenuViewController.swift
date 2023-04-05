//
//  MenuViewController.swift
//  PizzaMarket
//
//  Created by Максим Никитюк on 05.04.2023.
//

import UIKit

class MenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    @IBOutlet weak var table: UITableView!
    
    var pizza: [Pizza] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        APIManager.shared.getPizza(id: "pizza1", imageID: "1", completion: {res1 in
            self.pizza.append(res1!)
            APIManager.shared.getPizza(id: "pizza2", imageID: "2", completion: {res2 in
                self.pizza.append(res2!)
                APIManager.shared.getPizza(id: "pizza3", imageID: "3", completion: {res3 in
                    self.pizza.append(res3!)
                    APIManager.shared.getPizza(id: "pizza4", imageID: "4", completion: {res4 in
                        self.pizza.append(res4!)
                        DispatchQueue.main.async {
                            self.table.reloadData()
                        }
                    })
                })
            })
        })
       
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pizza.count
    
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MenuTableViewCell
           cell.pizzaName.text = pizza[indexPath.row].name
           cell.pizzaIngredient.text = pizza[indexPath.row].ingredient
           cell.pizzaImage.image = pizza[indexPath.row].image
           return cell
       }

}
