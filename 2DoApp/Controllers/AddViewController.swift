//
//  AddViewController.swift
//  2DoApp
//
//  Created by Azim Güneş on 19.02.2024.
//

import UIKit

class AddViewController: UIViewController {
    
    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var contentTextView: UITextView!
    
    @IBOutlet weak var navBar: UINavigationItem!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveNoteButton(_ sender: UIBarButtonItem) {
        guard let text = titleTextField.text else { return }
        guard let content = contentTextView.text else { return}
        
        if text == "", content == "" {
            let alert = UIAlertController(title: "Heyy!!", message: "There is no something.", preferredStyle: UIAlertController.Style.alert)
            let alertButton = UIAlertAction(title: "I Understand.", style: UIAlertAction.Style.default, handler: { _ in
                self.dismiss(animated: true)
            })
            alert.addAction(alertButton)
            self.present(alert, animated: true)
        }
 
    }
    
    
    @IBAction func cancelButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    
}
