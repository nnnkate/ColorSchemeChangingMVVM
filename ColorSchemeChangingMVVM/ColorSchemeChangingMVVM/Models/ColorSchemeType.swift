//
//  ColorSchemeType.swift
//  ColorSchemeChangingMVVM
//
//  Created by Екатерина Неделько on 26.06.22.
//

import UIKit

protocol ColorSchemeType {
    var backgroundColor: UIColor { get }
    var titleColor: UIColor { get }
    var additionalColor: UIColor { get }
}

extension ColorSchemeType {
    var titleColor: UIColor {
        .blue
    }
    
    var backgroundColor: UIColor {
        .white
    }
    
    var additionalColor: UIColor {
        .white
    }
}
