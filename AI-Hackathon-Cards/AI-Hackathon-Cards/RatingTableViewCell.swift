//
//  RatingTableViewCell.swift
//  AI-Hackathon-Cards
//
//  Created by Z on 15.03.2019.
//  Copyright © 2019 Beta. All rights reserved.
//

import UIKit

class RatingTableViewCell: UITableViewCell {

    @IBOutlet weak var like: UILabel!
    @IBOutlet weak var dislike: UILabel!
    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
