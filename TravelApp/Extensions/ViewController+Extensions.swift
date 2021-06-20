//
//  ViewController+Extensions.swift
//  TravelApp
//
//  Created by Anna Ostapenko on 19.06.21.
//

import UIKit
import CoreData

extension UIView {
    func setThemeColors(mainElement: UIView, secondaryElement: UINavigationBar?) {
        let themeValue = Int(retrieveThemeData())
        let model = ThemeModel.getThemeModel(model: themeValue ?? 0)
        mainElement.backgroundColor = hexStringToUIColor(hex: model.primaryColor)
        if (secondaryElement != nil) {
            secondaryElement?.barTintColor = hexStringToUIColor(hex: model.secondaryColor)
            secondaryElement?.tintColor = hexStringToUIColor(hex: model.textColor)
            let textAttributes = [NSAttributedString.Key.foregroundColor:hexStringToUIColor(hex: model.textColor)]
            secondaryElement?.titleTextAttributes = textAttributes
        }
        mainElement.tintColor = hexStringToUIColor(hex: model.textColor)
    }
    
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
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
