//
//  Settings.swift
//  SwiftAuth
//
//  Created by Gdwn on 01/01/2025.
//

import SwiftUI

struct Store: View {
    
    @Binding var showStore : Bool
    @Environment (\.dismiss) private var dismissScreen // dismiss screen (recommended)
    @EnvironmentObject var navManager : NavigationClass
    
    var body: some View {
        NavigationStack(path: $navManager.screenManager) {
            VStack (spacing: 16) {
                Image(systemName: "storefront.fill")
                    .font(.system(size: 48))
                Text("This is your store")
                
                Text("Show Store : \(String(showStore))")
                
                MainButton(label: "Go back") {
                    dismissScreen()
                }
                
                MainButton(label: "Go to your products") {
                    navManager.push(to: .productpage)
                }
            }
            .navigationTitle("Store")
            .navigationDestination(for: NavScreens.self) { screen in
                switch screen {
                case .productpage :
                    Product()
                case .mainStore:
                    MainStore()
                case .cart:
                    Cart()
                }
            }
            .toolbar(showStore ? .visible : .hidden)
            .toolbar {
                Button("Go back") {
                    showStore = false
                    dismissScreen()
                }
            }
        }
    }
}

#Preview {
    Store(showStore: .constant(true))
        .environmentObject(NavigationClass())
}


struct MainStore : View {
    var body: some View {
        // the reason this didn't work is that I had a navigation stack in these views
        // it seems when you have navigation stacks in both the parent and the child,
        // it doesn't work and always snaps back to the parent
        VStack {
            Text("Main Store")
                .font(.title.bold())
        }
        .navigationTitle("Your Store")
    }
}


struct Product : View {
    var body: some View {
        VStack {
            
        }
        .navigationTitle("Products")
    }
}


struct Cart : View {
    var body: some View {
        VStack {
            
        }
        .navigationTitle("Cart")
    }
}
