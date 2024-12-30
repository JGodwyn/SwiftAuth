//
//  SessionManager.swift
//  SwiftAuth
//
//  Created by Gdwn on 29/12/2024.
//

import Foundation
import SwiftUI

enum CurrentState {
    case onboarding
    case loggedin
    case loggedout
}

final class SessionManager : ObservableObject {
    
    @Published private(set) var session : CurrentState // you might not have a current state when you open the app
    @AppStorage ("seenOnboarding") private(set) var seenOnboarding : Bool = false
    
    init() {
        self.session = .loggedout
        if !seenOnboarding {
            self.session = .onboarding
        }
    }
    
    func login() {
        self.session = .loggedin
    }
    
    func logout() {
        self.session = .loggedout
    }
    
    func resetOnboarding() {
        self.seenOnboarding = false
        self.session = .onboarding
    }
    
    func completeOnboarding() {
        self.seenOnboarding = true
        self.session = .loggedout
    }
}
