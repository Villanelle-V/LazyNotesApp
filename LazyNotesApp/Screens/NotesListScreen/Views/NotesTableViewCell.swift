//
//  NotesTableViewCell.swift
//  LazyNotesApp
//
//  Created by Polina on 14.04.2022.
//

import UIKit

class NotesTableViewCell: UITableViewCell {

    @IBOutlet weak var arrow: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var contextLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}

