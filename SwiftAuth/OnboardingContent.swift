//
//  OnboardingContent.swift
//  SwiftAuth
//
//  Created by Gdwn on 29/12/2024.
//

import SwiftUI

struct OnboardingContent: View {
    
    let content : OnboardingManager
    
    // to get the last page, you can add a properties to the struct
    
    var body: some View {
        VStack(spacing: 8) {
            Text(content.emoji)
                .font(.system(size: 96))
            Text(content.title)
                .font(.title)
                .bold()
            Text(content.description)
                .bold()
        }
        .foregroundStyle(.white)
        .multilineTextAlignment(.center)
        .padding()
        .background(.blue)
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    OnboardingContent(content: .init(emoji: "🤝",
                                     title: "Join the crew",
                                     description: "Do some random stuff when you join the crew"))
}

struct Content {
    var emoji : String
    var title : String
    var description : String
}
