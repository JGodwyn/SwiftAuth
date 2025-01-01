//
//  TermsAndConditions.swift
//  SwiftAuth
//
//  Created by Gdwn on 01/01/2025.
//

import SwiftUI

struct TermsAndConditions: View {
    
    let tappedAgree : () -> Void
    
    var body: some View {
        ScrollView (showsIndicators: false) {
            VStack {
                Text("Terms and Conditions")
                    .font(.title.bold())
                    .padding(.bottom, 16)
                
                ForEach(Array(repeating: "This is our terms and conditions, do well to accept them. You can't even move forward without doing so. You have to accept the terms", count: 13), id: \.self) { item in
                    Text(item)
                        .multilineTextAlignment(.center)
                }
            }
            .padding(.bottom, 24)
            MainButton(label: "Accept and Continue", fillContainer: true) {
                tappedAgree()
            }
        }
        .padding(.top)
        .padding(.horizontal, 16)
    }
}

#Preview {
    TermsAndConditions() {}
}
