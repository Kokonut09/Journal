//
//  Journal.swift
//  Journal
//
//  Created by Andrew Saeyang on 7/20/21.
//

import Foundation

class Journal: Codable{
    
    let title: String
    var entries: [Entry]
    let uuid: String
    
    init(title: String, entries: [Entry] = [] , uuid: String = UUID().uuidString) {
        self.title = title
        self.entries = entries
        self.uuid = uuid
    }
    
}

extension Journal: Equatable{
    static func == (lhs: Journal, rhs: Journal) -> Bool{
        return lhs.uuid == rhs.uuid
    }
    
}
