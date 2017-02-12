//
//  FaceStepsTableViewCell.swift
//  pink
//
//  Created by Gianne Flores on 2/12/17.
//  Copyright © 2017 Gianne Flores. All rights reserved.
//

import UIKit

class FaceStepsTableViewCell: UITableViewCell {

    @IBOutlet weak var Step: UILabel!
    @IBOutlet weak var numberStep: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
