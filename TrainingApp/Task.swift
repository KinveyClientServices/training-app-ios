//
//  Task.swift
//  TrainingApp
//
//  Created by Victor Barros on 2016-02-08.
//  Copyright © 2016 Kinvey. All rights reserved.
//

import Foundation
import Kinvey

class Task: Entity {
    dynamic var action: String?
    dynamic var dueDate: String = "2016-07-19T12:33:09.124Z"
    dynamic var completed: Bool = false

    class func build(action: String? = nil, dueDate: String, completed: Bool) -> Task {
        let task = Task()
        if let action = action {
            task.action = action
        }
        task.dueDate = dueDate
        task.completed = completed
        return task
    }
    
    override class func collectionName() -> String {
        return "Todo"   
    }
    
    override func propertyMapping(map: Map) {
        super.propertyMapping(map)
        
        action <- ("action", map["action"])
        dueDate <- ("dueDate", map["dueDate"])
        completed <- ("completed", map["completed"])
    }
    
}
