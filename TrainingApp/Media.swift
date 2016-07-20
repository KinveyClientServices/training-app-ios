//
//  Media.swift
//  TrainingApp
//
//  Created by Vladislav Krasovsky on 4/12/16.
//  Copyright © 2016 Kinvey. All rights reserved.
//

import Foundation
import Kinvey

class Media: Entity {
    dynamic var name: String?
    
    class func build(name: String? = nil) -> Media {
        let media = Media()
        if let name = name {
            media.name = name
        }
        return media
    }
    
    override class func collectionName() -> String {
        return "Media"
    }
    
    override func propertyMapping(map: Map) {
        super.propertyMapping(map)
        
        name <- ("name", map["name"])
    }
    
}