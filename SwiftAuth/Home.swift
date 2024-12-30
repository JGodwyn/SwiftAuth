//
//  HomeView.swift
//  SwiftAuth
//
//  Created by Gdwn on 29/12/2024.
//

import SwiftUI

// they reach here when they've signed in

struct Home: View {
    
    @EnvironmentObject var sessionObj : SessionManager
    
    var body: some View {
        Text("Hello, World!")
        
        MainButton(label: "Sign Out") {
            sessionObj.logout()
        }
    }
}

#Preview {
    Home()
        .environmentObject(SessionManager())
}
