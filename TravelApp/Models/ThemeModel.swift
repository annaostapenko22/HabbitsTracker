//
//  ThemeModel.swift
//  TravelApp
//
//  Created by Anna Ostapenko on 19.06.21.
//


struct ThemeModel {
    static func getThemeModel(model: Int)-> PaletteModel {
        var palette: PaletteModel = PaletteModel(primaryColor: "#F09820", secondaryColor: "#F07220", textColor: "#FFFFFF")
        switch model {
        
// MARK: - orange theme
        
        case 0:
            palette = PaletteModel(primaryColor: "#FFC288", secondaryColor: "#FF6701", textColor: "#FFFFFF")
            
// MARK: - gray theme
        
        case 1:
            palette = PaletteModel(primaryColor: "#97999B", secondaryColor: "#7D8085", textColor: "#F8F5F1")
            
// MARK: - green theme
        
        case 2:
            palette = PaletteModel(primaryColor: "#A7C4BC", secondaryColor: "#2F5D62", textColor: "#FFFFFF")
            
// MARK: - violett theme
        
        case 3:
            palette = PaletteModel(primaryColor: "#B4AEE8", secondaryColor: "#440A67", textColor: "#FFFFFF")
            
// MARK: - blue theme
        
        case 4:
            palette = PaletteModel(primaryColor: "#D8E3E7", secondaryColor: "#126E82", textColor: "#FFFFFF")
            
// MARK: - yellow theme
        
        case 5:
            palette = PaletteModel(primaryColor: "#FBEEAC", secondaryColor: "#F4D160", textColor: "#28527A")
            
// MARK: - default orange theme
            
        default:
            palette = PaletteModel(primaryColor: "#FFC288", secondaryColor: "#FF6701", textColor: "#FFFFFF")
        }
        return palette
    }
}

struct PaletteModel {
    let primaryColor: String
    let secondaryColor: String
    let textColor: String
}



