//
//  SettingsViewController.swift
//  2DoApp
//
//  Created by Azim Güneş on 12.02.2024.
//

import UIKit

class QuotesViewController: UIViewController {
    
    var myBackgroundColor: UIColor = .white
    
    
    
    
    @IBOutlet weak var dailyQuoteLabel: UILabel!
    
    @IBOutlet weak var authorLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func getDailyQs(_ sender: UIButton) {
        let url = URL(string: "https://api.quotable.io/random"
        )
        let session = URLSession.shared
        let task = session.dataTask(with: url!) { data, response, error in
            if error != nil {
                print("Error")
            } else {
                if data != nil {
                    let jsonResponse = try? JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String:Any]
                    
                    DispatchQueue.main.async {
                        
                        if let content = jsonResponse!["content"] as? String {
                            self.dailyQuoteLabel.text = String(content)
                            
                        }
                        
                        if let author = jsonResponse!["author"] as? String {
                            self.authorLabel.text = String(author)
                            
                        }
                    }
                }
            }
        }
        task.resume()
    }
    
    
}
