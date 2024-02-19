//
//  NotesViewController.swift
//  2DoApp
//
//  Created by Azim Güneş on 19.02.2024.
//

import UIKit

class NotesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var notesTableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        notesTableView.dataSource = self
        notesTableView.delegate = self
        notesTableView.register(UITableViewCell.self, forCellReuseIdentifier: "notecell")
        

        
        let nib = UINib(nibName: "NoteCell", bundle: Bundle.main)
        notesTableView.register(nib, forCellReuseIdentifier: NoteCell.cellId)
    
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let notecell = tableView.dequeueReusableCell(withIdentifier: NoteCell.cellId, for: [indexPath.row]) as! NoteCell
        notecell.titleLabel.text = "Title \(indexPath.row)"
        notecell.contentLabel.text = "Content \(indexPath.row)"
        return notecell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let contentText = "Content at Row \(indexPath.row)"
        performSegue(withIdentifier: "notedetail", sender: contentText)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "notedetail" {
            if let desVC = segue.destination as? NoteDetailsViewController {
                if let contentText = sender as? String {
                    desVC.contentText = contentText
                }
            }
        }
    }

}

