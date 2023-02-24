//
//  GoalKingsCell.swift
//  MatchColic
//
//  Created by Berire Şen Ayvaz on 21.02.2023.
//

import UIKit

class GoalKingsCell: UITableViewCell {

    @IBOutlet weak var lblName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBOutlet weak var lblGoals: UILabel!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
