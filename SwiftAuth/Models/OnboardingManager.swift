//
//  OnboardingManager.swift
//  SwiftAuth
//
//  Created by Gdwn on 29/12/2024.
//

import Foundation

struct OnboardingManager : Identifiable, Equatable {
    let id = UUID()
    var emoji : String
    var title : String
    var description : String
}


final class OnboardingClass : ObservableObject {
    
    @Published private(set) var onboardingObj : [OnboardingManager] = []
    
    func load() {
        self.onboardingObj = [
            .init(emoji: "🤝",
                  title: "Join the team",
                  description: "Do some random stuff when you join the team"),
            .init(emoji: "🛎️",
                  title: "Enjoy our services",
                  description: "We have something for everyone"),
            .init(emoji: "👨‍👧‍👦",
                  title: "Thriving community",
                  description: "Meet and find people that share the same interests as you"),
            
        ]
    }
}
