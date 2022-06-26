//
//  ViewModel.swift
//  ColorSchemeChangingMVVM
//
//  Created by Екатерина Неделько on 26.06.22.
//

final class ViewModel {
    
    let colorSchemes = ColorScheme.allCases

    func getColorSchemesItems() -> [String] {
        var colorSchemesItems = [String]()
        for item in colorSchemes {
            colorSchemesItems.append(item.title)
        }
        return colorSchemesItems
    }
    
    func selectSegmentIndex(_ index: Int, completion: (ColorSchemeType) -> Void) {
        switch index {
        case 1:
            completion(PinkScheme())
        case 2:
            completion(NightScheme())
        default:
            completion(LightScheme())
        }
    }
    
}

