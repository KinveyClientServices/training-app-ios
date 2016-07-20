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
        if let name = name {
            partner.name = name
        }
        if let company = company {
            partner.company = company
        }
        return partner
    }

    override class func collectionName() -> String {
        return "Partner"
    }
    
    override func propertyMapping(map: Map) {
        super.propertyMapping(map)

        //TODO: LAB: map the entity properties
        name <- ("name", map["partnername"])
        company <- ("company", map["partnercompany"])
    }
    
}
