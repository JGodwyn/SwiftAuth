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
                    .transition(.opacity)
            case .loggedout:
                Login()
                    .transition(.opacity)
            }
        }
        .animation(.easeIn, value: sessionObj.session)
    }
}

#Preview {
    MainApp()
        .environmentObject(SessionManager())
}
