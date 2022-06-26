//
//  ColorScheme.swift
//  ColorSchemeChangingMVVM
//
//  Created by Екатерина Неделько on 26.06.22.
//

enum ColorScheme: String, CaseIterable {
    case light = "Light"
    case pink = "Pink"
    case night = "Night"
    
    var title: String {
        return self.rawValue
    }
}
 
