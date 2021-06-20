//
//  SettingsTableViewCell.swift
//  TravelApp
//
//  Created by Anna Ostapenko on 18.06.21.
//

import UIKit

class SettingsTableViewCell: UITableViewCell {

    @IBOutlet var iconView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
      
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setSettingsItemValues(settingsItem: SettingsItem) {
        self.titleLabel.text = settingsItem.title
    }
    
}
