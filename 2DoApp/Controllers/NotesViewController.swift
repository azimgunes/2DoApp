//
//  NotesViewController.swift
//  2DoApp
//
//  Created by Azim Güneş on 12.02.2024.
//

import UIKit

class NotesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var notesTableView: UITableView!
    
    var models: [(title: String, note: String)] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        notesTableView.delegate = self
        notesTableView.dataSource = self
        
        didTapForAddNote(sender: UIBarButtonItem())
    }
    
   
    
    @IBAction func didTapForAddNote( sender: UIBarButtonItem) {
      //  performSegue(withIdentifier: "toNN", sender: self)
       let vc = storyboard?.instantiateViewController(withIdentifier: "toNN") as? NViewController
        vc?.navigationItem.largeTitleDisplayMode = .never
        vc?.completion = { noteTitle, note in
                    self.navigationController?.popViewController(animated: true)
                    self.models.append((title: noteTitle,note: note))
                    self.notesTableView.reloadData()
                    
                }
               
        }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellnote = tableView.dequeueReusableCell(withIdentifier: "cellnote", for: [indexPath.row])
        cellnote.textLabel?.text = models[indexPath.row].title
        cellnote.detailTextLabel?.text = models[indexPath.row].note

        return cellnote
    }
    
}


