//
//  NoteDetailsViewController.swift
//  2DoApp
//
//  Created by Azim Güneş on 19.02.2024.
//

import UIKit

class NoteDetailsViewController: UIViewController {

    var contentTextDetail : String?
    
    @IBOutlet weak private var detailView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailView.text = contentTextDetail
        
    }

}
