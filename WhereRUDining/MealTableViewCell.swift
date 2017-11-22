//
//  MealTableViewCell.swift
//  WhereRUDining
//
//  Created by Shyam Lad on 11/21/17.
//  Copyright © 2017 Shyam Lad. All rights reserved.
//

import UIKit

class MealTableViewCell: UITableViewCell {

   
    @IBOutlet weak var BreakfastLike: UIImageView!
    @IBOutlet weak var MealLabel: UILabel!
    @IBOutlet weak var LunchLabel: UILabel!
    @IBOutlet weak var DinnerLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
