//
//  GameTableViewCell.swift
//  Foosball
//
//  Created by Michael DiGuiseppi on 2/16/18.
//  Copyright © 2018 Michael DiGuiseppi. All rights reserved.
//

import UIKit

class GameTableViewCell: UITableViewCell {
    
    //MARK: Properties
    
    @IBOutlet weak var p1_name: UILabel!
    @IBOutlet weak var p1_score: UILabel!
    @IBOutlet weak var p2_name: UILabel!
    @IBOutlet weak var p2_score: UILabel!
    @IBOutlet weak var p1_winner: UIImageView!
    @IBOutlet weak var p2_winner: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
