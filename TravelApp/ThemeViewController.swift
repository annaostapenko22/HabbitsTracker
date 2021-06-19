//
//  ThemeViewController.swift
//  TravelApp
//
//  Created by Anna Ostapenko on 19.06.21.
//

import UIKit
import CoreData

class ThemeViewController: UIViewController {
    
    @IBOutlet var orangeThemeCircle: UIButton!
    @IBOutlet var grayThemeCircle: UIButton!
    @IBOutlet var greenThemeColor: UIButton!
    @IBOutlet var violetThemeColor: UIButton!
    @IBOutlet var blueThemeColor: UIButton!
    @IBOutlet var yellowThemeColor: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 50, weight: .bold, scale: .large)
        
        let largeBoldCircleFilled = UIImage(systemName: "circle.fill", withConfiguration: largeConfig)
        let largeBoldEmptyCircle = UIImage(systemName: "circle", withConfiguration: largeConfig)
        
        let value = retrieveThemeData()
        print("value \(value)")
        if value == "orange" {
            orangeThemeCircle.setImage(largeBoldCircleFilled, for: .normal)
            grayThemeCircle.setImage(largeBoldEmptyCircle, for: .normal)
            greenThemeColor.setImage(largeBoldEmptyCircle, for: .normal)
        }   else if value == "gray" {
            orangeThemeCircle.setImage(largeBoldCircleFilled, for: .normal)
            grayThemeCircle.setImage(largeBoldEmptyCircle, for: .normal)
            greenThemeColor.setImage(largeBoldEmptyCircle, for: .normal)
        }
        else {
            grayThemeCircle.setImage(largeBoldEmptyCircle, for: .normal)
            orangeThemeCircle.setImage(largeBoldEmptyCircle, for: .normal)
            greenThemeColor.setImage(largeBoldCircleFilled, for: .normal)
        }
        
    }
    
    
    @IBAction func onPaletteCirclePress(_ sender: UIButton) {
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 50, weight: .bold, scale: .large)
        let paletteCircleEmpty = UIImage(systemName: "circle", withConfiguration: largeConfig)
        let paletteCircleFilled = UIImage(systemName: "circle.fill", withConfiguration: largeConfig)
        
        if sender.tag == 0 {
            orangeThemeCircle.setImage(paletteCircleFilled, for: .normal)
            grayThemeCircle.setImage(paletteCircleEmpty, for: .normal)
            greenThemeColor.setImage(paletteCircleEmpty, for: .normal)
            saveThemeData(value: "orange")
        } else if sender.tag == 1 {
            orangeThemeCircle.setImage(paletteCircleEmpty, for: .normal)
            grayThemeCircle.setImage(paletteCircleFilled, for: .normal)
            greenThemeColor.setImage(paletteCircleEmpty, for: .normal)
            saveThemeData(value: "gray")
        } else {
            grayThemeCircle.setImage(paletteCircleEmpty, for: .normal)
            orangeThemeCircle.setImage(paletteCircleEmpty, for: .normal)
            greenThemeColor.setImage(paletteCircleFilled, for: .normal)
            saveThemeData(value: "green")
        }
    }
    
    
    @IBAction func goBack(_ sender: UIButton) {
        
    }
    
}

extension ThemeViewController {
    func saveThemeData(value: String) {
        let defaults = UserDefaults.standard
        defaults.set(value, forKey: "theme")
    }
    
    func retrieveThemeData() -> String{
        let defaults = UserDefaults.standard
        guard let savedValue = defaults.string(forKey: "theme") else { return "gray" }
        return savedValue
    }
}
