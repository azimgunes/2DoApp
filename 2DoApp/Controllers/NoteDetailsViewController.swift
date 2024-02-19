//
//  NoteDetailsViewController.swift
//  2DoApp
//
//  Created by Azim Güneş on 19.02.2024.
//

import UIKit

class NoteDetailsViewController: UIViewController {
    
    var contentText : String?
    
    @IBOutlet weak private var detailView: UITextView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        detailView.text = contentText

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
