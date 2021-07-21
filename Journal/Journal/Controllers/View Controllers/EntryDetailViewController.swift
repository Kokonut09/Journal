//
//  EntryDetailViewController.swift
//  Journal
//
//  Created by Andrew Saeyang on 7/19/21.
//

import UIKit

class EntryDetailViewController: UIViewController {
    
    
    var entry: Entry?
    var journal: Journal?
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var bodyTextView: UITextView!
    
    @IBAction func clearButtonTapped(_ sender: Any) {
        
        titleTextField.text = ""
        bodyTextView.text = ""
    }
    @IBAction func saveButtonTapped(_ sender: Any) {
        
    
        guard let title = titleTextField.text, !title.isEmpty,
              let body = bodyTextView.text, !body.isEmpty,
              let journal = journal else {return}
       
        if let entry = entry{
            // if line 13 has value, an exisitng entry was selected -> update
            EntryController.update(entry: entry, title: title, body: body)
            
        }else{
            
            EntryController.createEntry(title: title, body: body, journal: journal)
            
        }
        
        
        navigationController?.popViewController(animated: true)
        updateViews()
        dismiss(animated: true)
    
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    
        updateViews()

        // Do any additional setup after loading the view.
    }
    

    func updateViews(){
        guard let entry = entry else {return}
        
        titleTextField.text = entry.title
        bodyTextView.text = entry.body
        
    }
    
}
