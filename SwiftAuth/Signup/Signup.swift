//
//  Signup.swift
//  SwiftAuth
//
//  Created by Gdwn on 30/12/2024.
//

import SwiftUI

struct Signup: View {
    
    @StateObject private var userobj = UserClass()
    @StateObject private var currentTab = tabRouter()
    @FocusState private var inputFocused : Bool
    
    var body: some View {
        ZStack {
            Color.blue
                .ignoresSafeArea()
            
            TabView (selection : $currentTab.router) {
                Username(username: $userobj.userManager.username) {
                    currentTab.nextTab()
                    inputFocused = false
                }
                .focused($inputFocused)
                .tag(tabRouter.tab.username)
                
                Age(age: $userobj.userManager.age) {
                    currentTab.nextTab()
                }
                .tag(tabRouter.tab.age)
                
                Bio(textContent: $userobj.userManager.bio) {
                    inputFocused = false
                }
                .focused($inputFocused)
                .tag(tabRouter.tab.bio)
            }
            .overlay(alignment: .topLeading) {
                if currentTab.router != .username {
                    MainButton(label: "Back", icon: "chevron.left", color: .black) {
                        inputFocused = false
                        currentTab.prevTab()
                    }
                    .padding(.leading)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .animation(.spring, value: currentTab.router)
        }
        .onAppear {
            // disable the scroll functionality
            UIScrollView.appearance().isScrollEnabled = false
        }
        .onDisappear {
            // disable the scroll functionality
            // very important to do this else you won't be able to scroll in your app
            UIScrollView.appearance().isScrollEnabled = true
        }
    }
}

#Preview {
    Signup()
}


// this class handles the change of tabs
final class tabRouter : ObservableObject {
    
    @Published var router : tab = .username
    
    enum tab : Int, CaseIterable {
        case username
        case age
        case bio
    }
    
    func changeScreen(tab : tab) {
        self.router = tab
    }
    
    func nextTab() {
        let nextTabIndex = min(router.rawValue + 1, tab.allCases.last!.rawValue)
        if let screen = tab(rawValue: nextTabIndex) {
            router = screen
        }
    }
    
    func prevTab() {
        let prevTabIndex = max(router.rawValue - 1, tab.allCases.first!.rawValue)
        if let screen = tab(rawValue: prevTabIndex) {
            router = screen
        }
    }
}
