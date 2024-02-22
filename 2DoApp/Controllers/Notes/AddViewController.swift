//
//  AddViewController.swift
//  2DoApp
//
//  Created by Azim Güneş on 19.02.2024.
//

import UIKit
import CoreData

class AddViewController: UIViewController {
    
    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var contentTextView: UITextView!
    
    @IBOutlet weak var navBar: UINavigationItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func saveNoteButton(_ sender: UIBarButtonItem) {
        
        
        let appDelegateForNotes = UIApplication.shared.delegate as! AppDelegate
        let contextForNotes = appDelegateForNotes.persistentContainer.viewContext
        let saveData = NSEntityDescription.insertNewObject(forEntityName: "Notes", into: contextForNotes)
        
        saveData.setValue(titleTextField.text!, forKey: "title")
        saveData.setValue(contentTextView.text!, forKey: "content")
        
        
        try? contextForNotes.save()
        print("Mission Completed.")
        self.dismiss(animated: true)
        
        
        
        
        
        NotificationCenter.default.post(name: NSNotification.Name.init("newData"), object: nil)
        
    }
    
    
    @IBAction func cancelButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
}
