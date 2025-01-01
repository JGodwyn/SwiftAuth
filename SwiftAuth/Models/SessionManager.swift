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
    case signingUp
    case loggingin
    case loggedin
    case loggedout
}

// If it's my first time, take me to sign up
// If I've logged in before, take me to login
// essentially, if I've clicked logout, always return me to login

final class SessionManager : ObservableObject {
    
    @Published private(set) var session : CurrentState // you might not have a current state when you open the app
    @AppStorage ("seenOnboarding") private(set) var seenOnboarding : Bool = false
    @AppStorage("hasLoggedInBefore") private(set) var hasLoggedInBefore : Bool = false
    
    init() {
        self.session = .loggedout
        if !seenOnboarding {
            self.session = .onboarding
        }
    }
    
    func login() {
        self.session = .loggedin
    }
    
    func signingUp() {
        self.session = .signingUp
    }
    
    func register() {
        self.hasLoggedInBefore = true
        self.session = .loggedin
    }
    
    func logginIn() {
        self.session = .loggingin
    }
    
    func logout() {
        self.session = .loggedout
    }
    
    func resetOnboarding() {
        self.seenOnboarding = false
        self.hasLoggedInBefore = false
        self.session = .onboarding
    }
    
    func completeOnboarding() {
        self.seenOnboarding = true
        self.session = .loggedout
    }
}
