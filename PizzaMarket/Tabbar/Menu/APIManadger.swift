//
//  APIManadger.swift
//  PizzaMarket
//
//  Created by Максим Никитюк on 06.04.2023.
//

import Foundation
import UIKit
import Firebase
import FirebaseStorage
import FirebaseDatabase

class APIManager {
    
    static let shared = APIManager()
    
    private func configureFB() -> Firestore {
        var db: Firestore!
        let setting = FirestoreSettings()
        Firestore.firestore().settings = setting
        db = Firestore.firestore()
        return db
    }
    
    func getPizza(id: String, imageID: String, completion: @escaping(Pizza?) -> Void) {
        let db = configureFB()
        db.collection("pizza").document(id).getDocument() { (document, error) in
            guard error == nil else {completion(nil); return}
            self.getImage(id: imageID, completion: {image in
                let pizza = Pizza(name: document?.get("name") as! String, ingredient: document?.get("ingredient") as! String, image: image)
                completion(pizza)
            })
            
            
        }
    }
    
    func getImage(id: String, completion: @escaping(UIImage) -> Void){
        let storege = Storage.storage()
        let reference = storege.reference()
        let pathRef = reference.child("pictures")
        
        var image: UIImage = UIImage(named: "food")!
        
        let fileRef = pathRef.child(id + ".jpg")
        fileRef.getData(maxSize: 300*300, completion: {data, error in
            guard error == nil else {completion(image); return}
            image = UIImage(data: data!)!
            completion(image)
            })
        
    }
    
}

struct Pizza {
    let name: String
    let ingredient: String
    let image: UIImage
}

