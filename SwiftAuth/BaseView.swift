//
//  SwiftAuthApp.swift
//  SwiftAuth
//
//  Created by Gdwn on 28/12/2024.
//

import SwiftUI

@main
struct BaseView: App {
    
    @StateObject private var sessionObj = SessionManager()
    
    var body: some Scene {
        WindowGroup {
            // I made a new file for this because you can't show transitions in your root file
            MainApp()
        }
        .environmentObject(sessionObj)
    }
}
