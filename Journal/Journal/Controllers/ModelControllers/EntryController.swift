//
//  EntryController.swift
//  Journal
//
//  Created by Andrew Saeyang on 7/19/21.
//

import Foundation

class EntryController{
    
 
    static func createEntry(title: String, body: String, journal: Journal) {
        
       // let newEntry = Entry(title: title, body: body)
        
        JournalController.sharedInstance.addEntryTo(journal: journal, title: title, body: body)

    }

    static func deleteEntry(entry: Entry, journal: Journal) {
        
        JournalController.sharedInstance.removeEntryFrom(journal: journal, entry: entry)
       
    }
    
    static func update(entry: Entry, title: String, body: String){
        
        entry.title = title
        entry.body = body
        
        JournalController.sharedInstance.saveToPersistentStorage()
    }



} //End of class
