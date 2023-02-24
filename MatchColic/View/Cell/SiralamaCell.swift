//
//  SiralamaCell.swift
//  MatchColic
//
//  Created by Berire Şen Ayvaz on 15.02.2023.
//

import UIKit

class SiralamaCell: UITableViewCell {

    @IBOutlet weak var lblSira: UILabel!
    @IBOutlet weak var lblTakim: UILabel!
    @IBOutlet weak var lblOyun: UILabel!
    @IBOutlet weak var lblGalibiyet: UILabel!
    
    @IBOutlet weak var lblBeraberlik: UILabel!
    @IBOutlet weak var lblMaglubiyet: UILabel!

    @IBOutlet weak var lblAtilanGol: UILabel!
    @IBOutlet weak var lblYenilenGol: UILabel!
    @IBOutlet weak var lblAveraj: UILabel!
    @IBOutlet weak var lblPuan: UILabel!

    
   
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
