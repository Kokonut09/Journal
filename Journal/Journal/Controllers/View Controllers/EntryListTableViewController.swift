//
//  EntryListTableViewController.swift
//  Journal
//
//  Created by Andrew Saeyang on 7/19/21.
//

import UIKit

class EntryListTableViewController: UITableViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
      //  updateViews()
        
    }

    var journal: Journal?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }
    
    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return journal?.entries.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellEntry", for: indexPath)

        guard let journal = journal else {return cell}
        
        let entry = journal.entries[indexPath.row]
        
        cell.textLabel?.text = entry.title
        cell.detailTextLabel?.text = entry.body
        cell.detailTextLabel?.text = entry.date.formatToString()

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            
            guard let journal = journal else {return}
            
            let entryToDelete = journal.entries[indexPath.row]
            
            
            EntryController.deleteEntry(entry: entryToDelete, journal: journal)
            
            
            //EntryController.sharedInstance.deleteEntry(entry: entryToDelete)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

   
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
        //Identifier
        if segue.identifier == "viewPrevious"{
            //IndexPath
            //Destination
            guard let indexPath = tableView.indexPathForSelectedRow,
                  let destination = segue.destination as? EntryDetailViewController,
                  let journal = journal else {return}
            
        //Object to send
        
            let entryToSend = journal.entries[indexPath.row]
        
            //Object to recieve
            
            //destination.entry= journal.entries[]
            destination.entry = entryToSend
            destination.journal = journal
        
        } else if segue.identifier == "createNewEntry"{
            
            guard let destination = segue.destination as? EntryDetailViewController,
                  let journal = journal else {return}

        //Object to recieve
           
            destination.journal = journal
            
        }
    }
}//End of class
