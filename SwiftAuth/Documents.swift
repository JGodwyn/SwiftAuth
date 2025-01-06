//
//  Documents.swift
//  SwiftAuth
//
//  Created by Gdwn on 03/01/2025.
//

import SwiftUI

struct Documents: View {
    
    @EnvironmentObject var navManager : NavigationClass
    @Environment (\.dismiss) private var dismissScreen
    
    var body: some View {
        NavigationStack(path: $navManager.screenManager) {
            VStack (spacing: 16) {
                Image(systemName: "storefront.fill")
                    .font(.system(size: 48))
                Text("This is your store")
                
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
            .toolbar {
                Button("Go back") {
                    dismissScreen()
                }
            }
        }
    }
}

#Preview {
    Documents()
        .environmentObject(NavigationClass())
}
