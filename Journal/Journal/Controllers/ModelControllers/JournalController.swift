//
//  JournalController.swift
//  Journal
//
//  Created by Andrew Saeyang on 7/20/21.
//

import Foundation

class JournalController{
    
    static let sharedInstance = JournalController()
    var journals: [Journal] = []
    
    func createJouranlWith(title: String){
        
        let newJournal = Journal(title: title)
        journals.append(newJournal)
        
        saveToPersistentStorage()
        
    }
    
    
    //MARK: - CRUD
    
    func delete(journal: Journal){
        
        guard let index = journals.firstIndex(of: journal) else {return}
        
        journals.remove(at: index)
        
        saveToPersistentStorage()
        
    }
    
    func addEntryTo(journal: Journal, title: String, body: String ){
        
         let newEntry = Entry(title: title, body: body)
        
         journal.entries.append(newEntry)
        
        saveToPersistentStorage()

    }
    
    func removeEntryFrom(journal: Journal, entry: Entry){
        
        guard let index = journal.entries.firstIndex(of: entry) else {return}
        
        journal.entries.remove(at: index)
        
        saveToPersistentStorage()
        
    }
    
    //MARK: - Persistence
    
    private func fileURL() -> URL {
     let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
     let documentsDirectoryURL = urls[0].appendingPathComponent("Journal.json")
     return documentsDirectoryURL
    }
    
    func saveToPersistentStorage(){
        do{
            let data = try JSONEncoder().encode(journals)
            try data.write(to: fileURL())
        }catch{
            
            print("Save error uhhhh.....")
        }
    }
    
    func loadFromPersistentStorage(){
        
        do{
            let data = try Data(contentsOf: fileURL())
            let journals = try JSONDecoder().decode([Journal].self, from: data)
            self.journals = journals
        }catch{
            print("Could not load...uhhmmm")
            
        }
    }
    
}
