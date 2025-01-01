//
//  Signup.swift
//  SwiftAuth
//
//  Created by Gdwn on 30/12/2024.
//

import SwiftUI

struct Signup: View {
    
    @EnvironmentObject private var session : SessionManager
    @StateObject private var userobj = UserClass()
    @StateObject private var currentTab = tabRouter()
    @FocusState private var inputFocused : Bool
    @State private var showTerms : Bool = false
    @State private var isRegistering : Bool = false // to handle the overlay and ProgressView when you accept terms and conditions
    
    var body: some View {
        ZStack {
            Color.blue
                .ignoresSafeArea()
            
            TabView (selection : $currentTab.router) {
                Username(username: $userobj.userManager.username, userobserved: userobj) {
                    userobj.validateUsername()
                    inputFocused = false
                    if !userobj.hasError {
                        currentTab.nextTab()
                    }
                }
                .focused($inputFocused)
                .tag(tabRouter.tab.username)
                
                Age(age: $userobj.userManager.age) {
                    currentTab.nextTab()
                }
                .tag(tabRouter.tab.age)
                
                Bio(textContent: $userobj.userManager.bio, userobserved: userobj) {
                    userobj.validateBio()
                    inputFocused = false
                    if !userobj.hasError {
                        showTerms.toggle()
                    }
                }
                .focused($inputFocused)
                .tag(tabRouter.tab.bio)
            }
            .overlay(alignment: .topLeading) {
                HStack {
                    if currentTab.router != .username {
                        MainButton(label: "Back", icon: "chevron.left", color: .black) {
                            inputFocused = false
                            currentTab.prevTab()
                        }
                        .padding(.leading)
                    } else {
                        MainButton(label: "Login") {
                            session.logginIn()
                        }
                    }
                    Spacer()
                    MainButton(label: "Reset") {
                        UIScrollView.appearance().isScrollEnabled = true
                        session.resetOnboarding()
                    }
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .animation(.spring, value: currentTab.router)
            .sheet(isPresented: $showTerms){
                TermsAndConditions() {
                    userobj.acceptedTerms = true
                    isRegistering = true
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                        isRegistering = false
                        session.register()
                    }
                }
                .animation(.easeInOut, value: isRegistering)
                .overlay {
                    if isRegistering {
                        ZStack {
                            Color(.gray.opacity(0.7))
                            VStack {
                                ProgressView()
                                    .scaleEffect(1.75)
                            }
                            .frame(width: 100, height: 100)
                            .background(.regularMaterial, in: RoundedRectangle(cornerRadius: 12))
                        }
                        .ignoresSafeArea()
                        .transition(.opacity)
                    }
                }
                .interactiveDismissDisabled(isRegistering)
            }
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
        .environmentObject(SessionManager())
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
