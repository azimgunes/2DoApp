//
//  NotesViewController.swift
//  2DoApp
//
//  Created by Azim Güneş on 12.02.2024.
//

import UIKit

class NotesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()


    }
    
   
    
    @IBAction func didTapForAddNote(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "New Note", message: "Remember! Verba volant scripta manent!", preferredStyle: UIAlertController.Style.alert)
        alert.addTextField(configurationHandler: nil)
        alert.addAction(UIAlertAction(title: "OKEY", style: UIAlertAction.Style.cancel, handler: { _ in
            guard let field = alert.textFields?.first, let text = field.text, !text.isEmpty else {
                return
            }
            
        }))
        present(alert, animated: true)
    }
    
}


