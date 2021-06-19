//
//  CustomTableViewCell.swift
//  TravelApp
//
//  Created by Владимир Рубис on 18.06.2021.
//

import UIKit

class CustomTableViewCell: UITableViewCell {


    @IBOutlet weak var habbitViewCell: UIView!
    @IBOutlet weak var habbitImage: UIImageView!
    @IBOutlet weak var habbitLabel: UILabel!
    @IBOutlet weak var habbitButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        habbitViewCell.layer.cornerRadius = 15
    }
    
}
