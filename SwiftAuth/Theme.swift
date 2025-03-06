//
//  Theme.swift
//  SwiftAuth
//
//  Created by Gdwn on 08/01/2025.
//

import Foundation
import SwiftUI

enum BrandColors {
    static let primary : Color = Color("Primary")
}

enum AppImages {
    static let weather : Image = Image("Weather")
}

enum SchemeType : Int, CaseIterable, Identifiable {
    // Int because you want to store the value to @Appstorage
    // Caseiterable so you can cycle through all cases via a Picker
    // Identifiable so the picker can uniquely identify each item
    
    var id : Self { self } // identifiable requires you to have this
    case system
    case light
    case dark
    
    var title : String {
        switch self {
        case .system :
            return "System"
        case .light:
            return "Light"
        case .dark:
            return "Dark"
        }
    }
}
