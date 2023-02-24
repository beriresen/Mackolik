//
//  LigListCell.swift
//  MatchColic
//
//  Created by Berire Şen Ayvaz on 14.02.2023.
//

import UIKit

class LigListCell: UITableViewCell {

    @IBOutlet weak var imgFlag: UIImageView!
    @IBOutlet weak var lblLig: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
