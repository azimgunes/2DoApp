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
    }
    
   
    
    @IBAction func didTapForAddNote(_ sender: UIBarButtonItem) {
        self.performSegue(withIdentifier: "new", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "note") as? NLViewController else {
            return
        }
        vc.title = "Looking Notes"
        navigationController?.pushViewController(vc, animated: true)
        
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


