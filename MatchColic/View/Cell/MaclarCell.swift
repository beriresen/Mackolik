//
//  MaclarCell.swift
//  MatchColic
//
//  Created by Berire Şen Ayvaz on 20.02.2023.
//

import UIKit

class MaclarCell: UITableViewCell {

    @IBOutlet weak var lblLig: UILabel!
    @IBOutlet weak var lblTime: UILabel!
    @IBOutlet weak var lblHome: UILabel!
    @IBOutlet weak var lblScore: UILabel!
    @IBOutlet weak var lblAway: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
