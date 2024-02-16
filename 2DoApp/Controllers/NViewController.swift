//
//  NViewController.swift
//  2DoApp
//
//  Created by Azim Güneş on 13.02.2024.
//

import UIKit

class NViewController: UIViewController {
    
    @IBOutlet weak var navBar: UINavigationItem!
    
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var noteView: UITextView!
    
    public var completion: ((String, String) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        titleField.becomeFirstResponder()
        
        UINavigationBar.appearance().tintColor = .orange

        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: UIBarButtonItem.Style.done, target: self, action: #selector(didTapSave))
        navigationItem.rightBarButtonItem?.tintColor = .orange

    }

    @objc func didTapSave() {
        if let text = titleField.text, !text.isEmpty, !noteView.text.isEmpty {
            completion?(text, noteView.text)
        }
    }
    
}
