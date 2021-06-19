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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let value = retrieveThemeData()
        print("value \(value)")
        if value == "orange" {
            orangeThemeCircle.setImage(UIImage(systemName: "circle.fill"), for: .normal)
        } else {
            grayThemeCircle.setImage(UIImage(systemName: "circle.fill"), for: .normal)
        }
     
    }
    
    
    @IBAction func onPaletteCirclePress(_ sender: UIButton) {
        let paletteCircleEmpty = UIImage(systemName: "circle")
        let paletteCircleFilled = UIImage(systemName: "circle.fill")
        
        if sender.tag == 0 {
            orangeThemeCircle.setImage(paletteCircleFilled, for: .normal)
            grayThemeCircle.setImage(paletteCircleEmpty, for: .normal)
            saveThemeData(value: "orange")

        } else {
            grayThemeCircle.setImage(paletteCircleFilled, for: .normal)
            orangeThemeCircle.setImage(paletteCircleEmpty, for: .normal)
            saveThemeData(value: "gray")
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
