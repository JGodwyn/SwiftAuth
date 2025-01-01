//
//  Username.swift
//  SwiftAuth
//
//  Created by Gdwn on 30/12/2024.
//

import SwiftUI

struct Username: View {
    
    @Binding var username : String
    @ObservedObject var userobserved : UserClass
    let tappedButton : () -> Void
    
    var body: some View {
        ZStack {
            Color(.blue)
                .ignoresSafeArea()
            VStack {
                Text("👤")
                    .font(.system(size: 80))
                Text("Username")
                    .font(.title.bold())
                TextField("Your username", text: $username)
                    .textFieldStyle(.whiteTextField)
                    .foregroundStyle(.black)
                if userobserved.hasError {
                    Text(userobserved.userErrorManager?.errorDescription ?? "")
                        .transition(.opacity)
                }
                MainButton(label: "Next", color: .black, height: 48,  fillContainer: true) {
                    tappedButton()
                }
                .padding(.top, 16)
            }
            .padding(24)
        }
        .foregroundStyle(.white)
        .animation(.easeInOut, value: userobserved.hasError)
    }
}

#Preview {
    Username(username: .constant(""), userobserved: .init()) {}
}
