//
//  Age.swift
//  SwiftAuth
//
//  Created by Gdwn on 30/12/2024.
//

import SwiftUI

struct Age: View {
    
    @Binding var age : Double
    let tappedButton : () -> Void
    
    var body: some View {
        ZStack {
            Color(.blue)
                .ignoresSafeArea()
            VStack {
                Text("☝️")
                    .font(.system(size: 80))
                
                Text("Your age?")
                    .font(.title.bold())
                
                Text("\(Int(age))")
                    .font(.title2.bold())
                
                Slider(value: $age, in: 18...100, step: 1)
                    .tint(.white)
                
                MainButton(label: "Next", color: .black, height: 48,  fillContainer: true) {
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
    Age(age: .constant(18)){}
}
