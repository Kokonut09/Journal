//
//  Entry.swift
//  Journal
//
//  Created by Andrew Saeyang on 7/19/21.
//

import Foundation

class Entry: Codable {
    var title: String
    var body: String
    let date: Date
    let uuid: String
    
    
    init(title: String, body: String, date: Date = Date(), uuid: String = UUID().uuidString) {
        self.title = title
        self.body = body
        self.date = date
        self.uuid = uuid
        
    }
    
    
    
}//End of class

//MARK: - Extensions

extension Entry: Equatable{
    static func == (lhs: Entry, rhs:Entry) -> Bool{
        
        return lhs.uuid == rhs.uuid
    }
    

    
}
