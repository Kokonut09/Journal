//
//  JournalListViewController.swift
//  Journal
//
//  Created by Andrew Saeyang on 7/20/21.
//

import UIKit

class JournalListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var journal: Journal?
    
    
    @IBOutlet weak var journalTitleTextfield: UITextField!
    
    @IBOutlet weak var journalListTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        JournalController.sharedInstance.loadFromPersistentStorage()

        journalListTableView.delegate = self
        journalListTableView.dataSource = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        journalListTableView.reloadData()

    }
    
    
    //MARK: - Actions
    
    @IBAction func createNewJournalbuttonTapped(_ sender: Any) {
        
        guard let title = journalTitleTextfield.text, !title.isEmpty else {return}
        
        JournalController.sharedInstance.createJouranlWith(title: title)
        print(JournalController.sharedInstance.journals)
        
        journalTitleTextfield.text = ""
        
        journalListTableView.reloadData()
        
        
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return JournalController.sharedInstance.journals.count
        
        
    }
    
    
     func tableView(_ journalListTableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = journalListTableView.dequeueReusableCell(withIdentifier: "journalCell", for: indexPath)

        let journal = JournalController.sharedInstance.journals[indexPath.row]
        
        cell.textLabel?.text = journal.title
       
        if journal.entries.count == 1 {
            
            cell.detailTextLabel?.text = "1 Entry"
        }else{
            
            cell.detailTextLabel?.text = "\(journal.entries.count) Entries"
            
        }

        return cell
    }
    
    
     func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            let journalToDelete = JournalController.sharedInstance.journals[indexPath.row]
            
            JournalController.sharedInstance.delete(journal: journalToDelete)
        
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
        //Identifier
        if segue.identifier == "toEntryList"{
            //IndexPath
            //Destination
            guard let indexPath = journalListTableView.indexPathForSelectedRow,
                  let destination = segue.destination as? EntryListTableViewController else {return}
        
        
        //Object to send
            let journalToSend = JournalController.sharedInstance.journals[indexPath.row]
        
        //Object to recieve
            print(journalToSend.title)
            destination.journal = journalToSend
        
        }
         
    }

}
