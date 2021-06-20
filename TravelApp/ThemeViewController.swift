//
//  ThemeViewController.swift
//  TravelApp
//
//  Created by Anna Ostapenko on 19.06.21.
//

import UIKit
import CoreData

let PaletteColors = [0: "orange",
                     1: "gray",
                     2: "green",
                     3: "violett",
                     4: "blue",
                     5: "yellow"
]


class ThemeViewController: UIViewController {
    
    @IBOutlet var themeColors: [UIButton]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setPaletteColors(chosenColor: Int(self.view.retrieveThemeData()) ?? 0)
    }
    
    
    @IBAction func onPaletteCirclePress(_ sender: UIButton) {
        setPaletteColors(chosenColor: sender.tag)
    }
    
    private func setPaletteColors(chosenColor: Int) {
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 50, weight: .bold, scale: .large)
        
        let largeBoldCircleFilled = UIImage(systemName: "circle.fill", withConfiguration: largeConfig)
        let largeBoldEmptyCircle = UIImage(systemName: "circle", withConfiguration: largeConfig)
        
        
        for themeColor in themeColors {
            if themeColor.tag == chosenColor {
                themeColor.setImage(largeBoldCircleFilled, for: .normal)
                self.view.saveThemeData(value: String(chosenColor))
            } else {
                themeColor.setImage(largeBoldEmptyCircle, for: .normal)
            }
        }
    }
}
