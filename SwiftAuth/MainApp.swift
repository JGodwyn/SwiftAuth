//
//  ContentView.swift
//  SwiftAuth
//
//  Created by Gdwn on 28/12/2024.
//

import SwiftUI

struct MainApp: View {
    @EnvironmentObject private var sessionObj : SessionManager
    
    var body: some View {
        ZStack {
            switch sessionObj.session {
            case .onboarding:
                Onboarding() {
                    sessionObj.completeOnboarding()
                }
                .transition(.opacity)
            case .loggedin:
                Home()
                    .transition(.move(edge: .leading).combined(with: .opacity))
            case .loggedout:
                if sessionObj.hasLoggedInBefore {
                    Login()
                        .transition(.opacity)
                } else {
                    Signup()
                        .transition(.opacity)
                }
            case .signingUp:
                Signup()
                    .transition(.opacity)
            case .loggingin:
                Login()
            }
        }
        .animation(.easeIn, value: sessionObj.session)
    }
}

#Preview {
    MainApp()
        .environmentObject(SessionManager())
}
