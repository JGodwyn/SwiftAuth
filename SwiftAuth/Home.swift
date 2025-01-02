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
    @State private var showDocuments : Bool = false
    
    var body: some View {
        TabView {
            content
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            test
                .tabItem {
                    Label("Test", systemImage: "testtube.2")
                }
            
            Documents(showDocuments: $showDocuments)
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        }
    }
}

#Preview {
    Home()
        .environmentObject(SessionManager())
}

extension Home {
    
    var content : some View {
        NavigationStack {
            ScrollView {
                // NavigationLink only works when placed in a NavigationStack
                // use NavigationLink for basic stuff like below.
                // the others are deprecated in iOS 16
                // to use bindings, you need to use the ".navigationDestination"
                NavigationLink("Go to settings") {
                    Documents(showDocuments: $showDocuments)
                }
                
                NavigationLink (destination : Documents(showDocuments: $showDocuments)) {
                    HStack {
                        Image(systemName: "gear")
                        Text("Go to settings")
                    }
                    .padding(.vertical)
                }
                
                MainButton(label: "Go to settings") {
                    showDocuments.toggle()
                }
                
                Text(String(showDocuments))
            }
            .padding()
            .navigationTitle("Home")
            .navigationDestination(isPresented: $showDocuments) {
                Documents(showDocuments: $showDocuments)
            }
            .toolbar {
                Button("Log out", role: .destructive) {
                    sessionObj.logout()
                }
            }
        }
    }
    
    var test : some View {
        NavigationStack {
            ScrollView {
                NavigationLink ("Go to settings") {
                    Documents(showDocuments: $showDocuments)
                }
            }
            .padding()
        }
    }
}
