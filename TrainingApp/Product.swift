//
//  Product.swift
//  TrainingApp
//
//  Created by Victor Barros on 2016-02-08.
//  Copyright © 2016 Kinvey. All rights reserved.
//

import Foundation
import Kinvey

class Product: Entity {
    dynamic var name: String?
    dynamic var productDescription: String?
    
    class func build(name: String? = nil) -> Product {
        let product = Product()
        if let name = name {
            product.name = name
        }
        return product
    }
    
    override class func collectionName() -> String {
        return "Products"
    }
    
    override func propertyMapping(map: Map) {
        super.propertyMapping(map)
        
        name <- ("name", map["productname"])
        productDescription <- ("productDescription", map["productdesc"])
    }
    
}
