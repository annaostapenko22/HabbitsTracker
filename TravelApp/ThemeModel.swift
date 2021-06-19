//
//  ThemeModel.swift
//  TravelApp
//
//  Created by Anna Ostapenko on 19.06.21.
//

import Foundation
import UIKit

struct ThemeModel {
    let orangeTheme = OrangePaletteModel()
    let grayTheme = GrayPaletteModel()
}

struct OrangePaletteModel {
    let viewColor = UIColor.systemOrange
    let textColor = UIColor.white
}

struct GrayPaletteModel {
    let viewColor = UIColor.systemGray6
    let textColor = UIColor.systemYellow
}
