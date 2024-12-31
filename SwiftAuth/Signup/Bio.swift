//
//  Bio.swift
//  SwiftAuth
//
//  Created by Gdwn on 30/12/2024.
//

import SwiftUI

struct Bio: View {
    
    @Binding var textContent : String
    let tappedButton : () -> Void
    
    var body: some View {
        ZStack {
            Color(.blue)
                .ignoresSafeArea()
            VStack {
                Text("✍️")
                    .font(.system(size: 80))
                Text("Your bio")
                    .font(.title.bold())
                
                TextEditor(text: $textContent)
                    .foregroundStyle(.black)
                    .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                    .overlay(alignment: .topLeading) {
                        if textContent.isEmpty {
                            Text("Your bio")
                                .foregroundStyle(.gray)
                                .padding(.horizontal, 4)
                                .padding(.vertical, 8)
                        }
                    }
                
                MainButton(label: "Next", color: .black, height: 48,  fillContainer: true, disabled: textContent.isEmpty) {
                    tappedButton()
                }
                .padding(.top, 16)
            }
            .padding(24)
        }
        .foregroundStyle(.white)
    }
}

#Preview {
    Bio(textContent: .constant("")) {}
}
