//
//  CustomTableViewCell.swift
//  TravelApp
//
//  Created by Владимир Рубис on 18.06.2021.
//

import UIKit

class CustomTableViewCell: UITableViewCell {


    @IBOutlet weak var habitViewCell: UIView!
    @IBOutlet weak var habitImage: UIImageView!
    @IBOutlet weak var habitLabel: UILabel!
    @IBOutlet weak var habitButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        habitViewCell.layer.cornerRadius = 15
    }
    
}
