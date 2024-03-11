//
//  NoteCell.swift
//  2DoApp
//
//  Created by Azim Güneş on 19.02.2024.
//

import UIKit

class NoteCell: UITableViewCell {
    
    static let cellId = "NoteCell"
    
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
 
}
