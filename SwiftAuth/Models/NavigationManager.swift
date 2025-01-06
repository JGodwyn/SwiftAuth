//
//  NavigationManager.swift
//  SwiftAuth
//
//  Created by Gdwn on 02/01/2025.
//

import Foundation
import SwiftUI

enum NavScreens : Hashable {
    case mainStore
    case productpage
    case cart
}

final class NavigationClass : ObservableObject {
    @Published var screenManager = NavigationPath()
    
    func push(to screen: NavScreens) {
        screenManager.append(screen)
    }
    
    func popToRoot() {
        screenManager = NavigationPath() // this will take it to the root app
//        screenManager.removeLast(screenManager.count) // go to the root app
    }
}

