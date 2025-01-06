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
                
                MainButton(label: "Go to your main store") {
                    navManager.push(to: .mainStore)
                }
            }
            .navigationTitle("Store")
            .navigationDestination(for: NavScreens.self) { screen in
                // the issue I have with this now is
                // do I have to do this everytime I want to link to a screen?
                switch screen {
                case .productpage :
                    Product()
                case .mainStore:
                    MainStore()
                case .cart:
                    Cart()
                }
            }
            .toolbar {
                if showStore {
                    ToolbarItem(placement: .topBarLeading) {
                        Button ("Products") {
                            navManager.push(to: .productpage)
                        }
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button ("Go back") {
                        showStore = false
                        dismissScreen()
                    }
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
    
    // the reason I am able to use this enviroment object is cos
    // this view functions as a child view of my store (since I embed it as a navdestination)
    // and every child view inherits the environment property of its parent view
    @EnvironmentObject var navManager : NavigationClass // do I have to define this everytime
    
    var body: some View {
        VStack {
            MainButton(label: "Go to cart") {
                navManager.push(to: .cart)
            }
        }
        .navigationDestination(for: NavScreens.self) { screen in
            // see the way I did it here
            // only use this when you'd want to ever go to one screen
            if screen == .cart {
                Cart()
            }
        }
        .navigationTitle("Products")
    }
}


struct Cart : View {
    
    @EnvironmentObject var navManager : NavigationClass
    @Environment (\.dismiss) private var dismissScreen
    
    var body: some View {
        VStack {
            MainButton(label: "Go to root app") {
                navManager.popToRoot()
            }
            
            MainButton(label: "Go back to products") {
                // using the enviroment dismiss
                dismissScreen()
            }
        }
        .navigationTitle("Cart")
    }
}
