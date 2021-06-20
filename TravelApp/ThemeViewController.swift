//
//  ThemeViewController.swift
//  TravelApp
//
//  Created by Anna Ostapenko on 19.06.21.
//

import UIKit
import CoreData

enum PaletteColor: String {
    case orange
    case gray
    case green
    case violett
    case blue
    case yellow 
}

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
            violetThemeColor.setImage(largeBoldEmptyCircle, for: .normal)
            blueThemeColor.setImage(largeBoldEmptyCircle, for: .normal)
            yellowThemeColor.setImage(largeBoldEmptyCircle, for: .normal)
        }   else if value == "gray" {
            grayThemeCircle.setImage(largeBoldCircleFilled, for: .normal)
            orangeThemeCircle.setImage(largeBoldEmptyCircle, for: .normal)
            greenThemeColor.setImage(largeBoldEmptyCircle, for: .normal)
            violetThemeColor.setImage(largeBoldEmptyCircle, for: .normal)
            blueThemeColor.setImage(largeBoldEmptyCircle, for: .normal)
            yellowThemeColor.setImage(largeBoldEmptyCircle, for: .normal)
        }
        else if value == "green" {
            greenThemeColor.setImage(largeBoldCircleFilled, for: .normal)
            orangeThemeCircle.setImage(largeBoldEmptyCircle, for: .normal)
            grayThemeCircle.setImage(largeBoldEmptyCircle, for: .normal)
            violetThemeColor.setImage(largeBoldEmptyCircle, for: .normal)
            blueThemeColor.setImage(largeBoldEmptyCircle, for: .normal)
            yellowThemeColor.setImage(largeBoldEmptyCircle, for: .normal)
        }
        else if value == "violett" {
            violetThemeColor.setImage(largeBoldCircleFilled, for: .normal)
            orangeThemeCircle.setImage(largeBoldEmptyCircle, for: .normal)
            grayThemeCircle.setImage(largeBoldEmptyCircle, for: .normal)
            greenThemeColor.setImage(largeBoldEmptyCircle, for: .normal)
            blueThemeColor.setImage(largeBoldEmptyCircle, for: .normal)
            yellowThemeColor.setImage(largeBoldEmptyCircle, for: .normal)
        }
        else if value == "blue" {
            blueThemeColor.setImage(largeBoldCircleFilled, for: .normal)
            orangeThemeCircle.setImage(largeBoldEmptyCircle, for: .normal)
            grayThemeCircle.setImage(largeBoldEmptyCircle, for: .normal)
            greenThemeColor.setImage(largeBoldEmptyCircle, for: .normal)
            violetThemeColor.setImage(largeBoldEmptyCircle, for: .normal)
            yellowThemeColor.setImage(largeBoldEmptyCircle, for: .normal)
        }
        else {
            yellowThemeColor.setImage(largeBoldCircleFilled, for: .normal)
            orangeThemeCircle.setImage(largeBoldEmptyCircle, for: .normal)
            grayThemeCircle.setImage(largeBoldEmptyCircle, for: .normal)
            greenThemeColor.setImage(largeBoldEmptyCircle, for: .normal)
            violetThemeColor.setImage(largeBoldEmptyCircle, for: .normal)
            blueThemeColor.setImage(largeBoldEmptyCircle, for: .normal)
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
            violetThemeColor.setImage(paletteCircleEmpty, for: .normal)
            blueThemeColor.setImage(paletteCircleEmpty, for: .normal)
            yellowThemeColor.setImage(paletteCircleEmpty, for: .normal)
            saveThemeData(value: "orange")
        } else if sender.tag == 1 {
            grayThemeCircle.setImage(paletteCircleFilled, for: .normal)
            orangeThemeCircle.setImage(paletteCircleEmpty, for: .normal)
            greenThemeColor.setImage(paletteCircleEmpty, for: .normal)
            violetThemeColor.setImage(paletteCircleEmpty, for: .normal)
            blueThemeColor.setImage(paletteCircleEmpty, for: .normal)
            yellowThemeColor.setImage(paletteCircleEmpty, for: .normal)
            saveThemeData(value: "gray")
        } else if sender.tag == 2 {
            orangeThemeCircle.setImage(paletteCircleEmpty, for: .normal)
            greenThemeColor.setImage(paletteCircleFilled, for: .normal)
            grayThemeCircle.setImage(paletteCircleEmpty, for: .normal)
            violetThemeColor.setImage(paletteCircleEmpty, for: .normal)
            blueThemeColor.setImage(paletteCircleEmpty, for: .normal)
            yellowThemeColor.setImage(paletteCircleEmpty, for: .normal)
            saveThemeData(value: "green")
        }else if sender.tag == 3 {
            grayThemeCircle.setImage(paletteCircleEmpty, for: .normal)
            blueThemeColor.setImage(paletteCircleEmpty, for: .normal)
            yellowThemeColor.setImage(paletteCircleEmpty, for: .normal)
            orangeThemeCircle.setImage(paletteCircleEmpty, for: .normal)
            violetThemeColor.setImage(paletteCircleFilled, for: .normal)
            greenThemeColor.setImage(paletteCircleEmpty, for: .normal)
            saveThemeData(value: "violett")
        }else if sender.tag == 4 {
            violetThemeColor.setImage(paletteCircleEmpty, for: .normal)
            grayThemeCircle.setImage(paletteCircleEmpty, for: .normal)
            yellowThemeColor.setImage(paletteCircleEmpty, for: .normal)
            orangeThemeCircle.setImage(paletteCircleEmpty, for: .normal)
            blueThemeColor.setImage(paletteCircleFilled, for: .normal)
            greenThemeColor.setImage(paletteCircleEmpty, for: .normal)
            saveThemeData(value: "blue")
        }
        else {
            violetThemeColor.setImage(paletteCircleEmpty, for: .normal)
            blueThemeColor.setImage(paletteCircleEmpty, for: .normal)
            greenThemeColor.setImage(paletteCircleEmpty, for: .normal)
            grayThemeCircle.setImage(paletteCircleEmpty, for: .normal)
            orangeThemeCircle.setImage(paletteCircleEmpty, for: .normal)
            yellowThemeColor.setImage(paletteCircleFilled, for: .normal)
            saveThemeData(value: "yellow")
        }
    }
    
    private func setPaletteColors(chosenColor: String) {
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 50, weight: .bold, scale: .large)
        
        let largeBoldCircleFilled = UIImage(systemName: "circle.fill", withConfiguration: largeConfig)
        let largeBoldEmptyCircle = UIImage(systemName: "circle", withConfiguration: largeConfig)
        
        let color = retrieveThemeData()
//        var paletteColor = PaletteColor.orange.rawValue
        switch color {
        case PaletteColor.orange.rawValue:
            orangeThemeCircle.setImage(largeBoldCircleFilled, for: .normal)
            grayThemeCircle.setImage(largeBoldEmptyCircle, for: .normal)
            greenThemeColor.setImage(largeBoldEmptyCircle, for: .normal)
            violetThemeColor.setImage(largeBoldEmptyCircle, for: .normal)
            blueThemeColor.setImage(largeBoldEmptyCircle, for: .normal)
            yellowThemeColor.setImage(largeBoldEmptyCircle, for: .normal)
        case PaletteColor.green.rawValue:
            greenThemeColor.setImage(largeBoldCircleFilled, for: .normal)
            orangeThemeCircle.setImage(largeBoldEmptyCircle, for: .normal)
            grayThemeCircle.setImage(largeBoldEmptyCircle, for: .normal)
            violetThemeColor.setImage(largeBoldEmptyCircle, for: .normal)
            blueThemeColor.setImage(largeBoldEmptyCircle, for: .normal)
            yellowThemeColor.setImage(largeBoldEmptyCircle, for: .normal)
        default:
            orangeThemeCircle.setImage(largeBoldCircleFilled, for: .normal)
            grayThemeCircle.setImage(largeBoldEmptyCircle, for: .normal)
            greenThemeColor.setImage(largeBoldEmptyCircle, for: .normal)
            violetThemeColor.setImage(largeBoldEmptyCircle, for: .normal)
            blueThemeColor.setImage(largeBoldEmptyCircle, for: .normal)
            yellowThemeColor.setImage(largeBoldEmptyCircle, for: .normal)
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
