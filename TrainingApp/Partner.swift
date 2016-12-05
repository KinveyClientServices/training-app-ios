//
//  Partner.swift
//  TrainingApp
//
//  Created by Victor Barros on 2016-02-08.
//  Copyright © 2016 Kinvey. All rights reserved.
//

import Foundation
import Kinvey

class Partner {
    dynamic var name: String?
    dynamic var company: String?
    dynamic var email: String?
    
    class func build(name: String? = nil, company: String? = nil) -> Partner {
        let partner = Partner()
        return partner
    }
    
    class func collectionName() -> String {
        return ""
    }
    
    func propertyMapping(map: Map) {
    }
}
