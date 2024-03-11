//
//  NotesViewController.swift
//  2DoApp
//
//  Created by Azim Güneş on 19.02.2024.
//

import UIKit
import CoreData

class NotesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var notesTableView: UITableView!
    
    var titleArray = [String]()
    var contentArray = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        getData()
        notesTableView.dataSource = self
        notesTableView.delegate = self
        notesTableView.register(UITableViewCell.self, forCellReuseIdentifier: "notecell")
        
        
        
        let nib = UINib(nibName: "NoteCell", bundle: Bundle.main)
        notesTableView.register(nib, forCellReuseIdentifier: NoteCell.cellId)
        
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contentArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let notecell = tableView.dequeueReusableCell(withIdentifier: NoteCell.cellId, for: [indexPath.row]) as! NoteCell
        notecell.titleLabel.text = titleArray[indexPath.row]
        notecell.contentLabel.text = contentArray[indexPath.row]
        return notecell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let contentText = contentArray[indexPath.row]
        performSegue(withIdentifier: "notedetail", sender: contentText)
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "notedetail" {
            if let desVC = segue.destination as? NoteDetailsViewController {
                
                if let contentText = sender as? String {
                    desVC.contentTextDetail = contentText
                    
                }
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(getData), name: NSNotification.Name("newData"), object: nil)
    }
    @objc func getData(){
        self.titleArray.removeAll(keepingCapacity: true)
        self.contentArray.removeAll(keepingCapacity: true)
        let appDelegateForNotes = UIApplication.shared.delegate as! AppDelegate
        let contextForNotes = appDelegateForNotes.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Notes")
        fetchRequest.returnsObjectsAsFaults = false
        
        do {
            let results = try contextForNotes.fetch(fetchRequest)
            for result in results as! [NSManagedObject] {
                if let title = result.value(forKey: "title") as? String {
                    if let content = result.value(forKey: "content") as? String {
                        self.titleArray.append(title)
                        self.contentArray.append(content)
                        
                    }
                }
                self.notesTableView.reloadData()
            }
        } catch {
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            print("Deleted")
            self.contentArray.remove(at: indexPath.row)
            self.titleArray.remove(at: indexPath.row)
            self.notesTableView.beginUpdates()
            self.notesTableView.deleteRows(at: [indexPath], with: .automatic)
            self.notesTableView.endUpdates()
            self.notesTableView.reloadData()
        }
        self.notesTableView.reloadData()
    }
    
}

