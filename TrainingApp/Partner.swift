//
//  Partner.swift
//  TrainingApp
//
//  Created by Victor Barros on 2016-02-08.
//  Copyright © 2016 Kinvey. All rights reserved.
//

import Foundation
import Kinvey

class Partner: Entity {
    dynamic var name: String?
    dynamic var company: String?
    
    class func build(name: String? = nil, company: String? = nil) -> Partner {
        let partner = Partner()
        //TODO: LAB: define the constructor
        return partner
    }

    override class func collectionName() -> String {
        //TODO: LAB: specify the collection name
    }
    
    override func propertyMapping(map: Map) {
        //TODO: LAB: map the entity properties
    }
    
}
