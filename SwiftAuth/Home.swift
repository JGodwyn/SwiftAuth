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
    @StateObject private var navObj = NavigationClass()
    @State private var showStore : Bool = false
    
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
            
            Store(showStore: $showStore)
                .tabItem {
                    Label("Store", systemImage: "storefront")
                }
            
            Documents()
                .tabItem {
                    Label("Document", systemImage: "folder")
                }
        }
        .environmentObject(navObj)
    }
}

#Preview {
    Home()
        .environmentObject(SessionManager())
        .environmentObject(NavigationClass())
}

extension Home {
    var content : some View {
        NavigationStack {
            ScrollView {
                // NavigationLink only works when placed in a NavigationStack
                // use NavigationLink for basic stuff like below.
                // the others are deprecated in iOS 16
                // to use bindings, you need to use the ".navigationDestination"
                NavigationLink("Go to store") {
                    Store(showStore: $showStore)
                }
                
                NavigationLink (destination : Store(showStore: $showStore)) {
                    HStack {
                        Image(systemName: "gear")
                        Text("Go to store")
                    }
                    .padding(.vertical)
                }
                
                MainButton(label: "Go to store") {
                    showStore.toggle()
                }
                
                Text(String(showStore))
            }
            .padding()
            .navigationTitle("Home")
            .navigationDestination(isPresented: $showStore) {
                Store(showStore: $showStore)
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
                    Store(showStore: $showStore)
                }
            }
            .padding()
        }
    }
}
