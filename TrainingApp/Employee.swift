//
//  Employee.swift
//  TrainingApp
//
//  Created by Vladislav Krasovsky on 4/12/16.
//  Copyright © 2016 Kinvey. All rights reserved.
//

import Foundation
import Kinvey

class Employee: Entity {    
    dynamic var name: String?
    
    class func build(name: String? = nil) -> Employee {
        let employee = Employee()
        if let name = name {
            employee.name = name
        }
        return employee
    }
    
    override class func collectionName() -> String {
        return "Employees"
    }
    
    override func propertyMapping(map: Map) {
        super.propertyMapping(map)
        
        name <- ("name", map["name"])
    }
    
}