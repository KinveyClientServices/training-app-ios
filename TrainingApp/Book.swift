//
//  Book.swift
//  TrainingApp
//
//  Created by Victor Barros on 2016-02-08.
//  Copyright © 2016 Kinvey. All rights reserved.
//

import Foundation
import Kinvey

class Book: Entity {
    dynamic var title: String?
    
    class func build(title: String? = nil) -> Book {
        let book = Book()
        if let title = title {
            book.title = title
        }
        return book
    }
    
    override class func collectionName() -> String {
        return "Book"
    }
    
    override func propertyMapping(map: Map) {
        super.propertyMapping(map)
        
        title <- ("title", map["title"])
    }
    
}
