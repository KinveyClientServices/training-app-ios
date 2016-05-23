//
//  Partner.swift
//  TrainingApp
//
//  Created by Victor Barros on 2016-02-08.
//  Copyright © 2016 Kinvey. All rights reserved.
//

import Foundation
import Kinvey

class Partner: NSObject, Persistable {
    
    dynamic var objectId: String?
    dynamic var name: String?
    dynamic var company: String?


    override init() {
    }
    
    init(name: String, company: String) {
        self.name = name
        self.company = company
    }
    
    static func kinveyCollectionName() -> String {
        //TODO: LAB: specify the Kinvey collection name
        return ""
    }
    
    static func kinveyPropertyMapping() -> [String : String] {
        //TODO: LAB: map the entity properties
        return [:]
    }
    
}
