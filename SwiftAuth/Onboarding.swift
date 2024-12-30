//
//  Onboarding.swift
//  SwiftAuth
//
//  Created by Gdwn on 29/12/2024.
//

import SwiftUI

struct Onboarding: View {
    
    @StateObject private var onboarding = OnboardingClass()
    @State private var showContinueBtn : Bool = false
    let tappedContinue : () -> Void
    
    var body: some View {
        ZStack {
            Color.blue
                .ignoresSafeArea()
            
            TabView {
                ForEach(onboarding.onboardingObj) { item in
                    OnboardingContent(content: item)
                        .onAppear {
                            if item == onboarding.onboardingObj.last {
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                    withAnimation {
                                        showContinueBtn = true
                                    }
                                }
                            }
                        }
                        .overlay (alignment: .bottom) {
                            if showContinueBtn {
                                MainButton(label: "Continue", color: .black) {
                                    tappedContinue()
                                }
                                .transition(.move(edge: .bottom).combined(with: .opacity))
                                .offset(y: 56)
                            }
                        }
                }
            }
            .tabViewStyle(.page)
            .indexViewStyle(.page(backgroundDisplayMode: .always))
        }
        .onAppear {
            onboarding.load()
        }
    }
}

#Preview {
    Onboarding() {}
}
