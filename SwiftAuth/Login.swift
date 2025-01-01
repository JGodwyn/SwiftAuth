//
//  Login.swift
//  SwiftAuth
//
//  Created by Gdwn on 28/12/2024.
//

import SwiftUI

struct Login: View {
    
    @EnvironmentObject var sessionObj : SessionManager
    
    var body: some View {
        ZStack {
            Color(.blue)
            VStack {
                VStack (spacing: 16) {
                    Text("🌍")
                        .font(.system(size: 128))
                    Text("Hello, World!")
                        .font(.title)
                        .bold()
                    Text("Enter your username and password to enter this app and enjoy all of it's services")
                }
                .foregroundStyle(.white)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 24)
                
                VStack (spacing: 16) {
                    TextField("Your username", text: .constant(""))
                    TextField("Your password", text: .constant(""))
                    MainButton(label: "Login", color: .black, height: 48, fillContainer: true) {
                        sessionObj.login()
                    }
                    
                    MainButton(label: "Sign up instead", height: 48, fillContainer: true) {
                        sessionObj.signingUp()
                    }
                }
                .textFieldStyle(.whiteTextField)
                .padding(24)
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    Login()
        .environmentObject(SessionManager())
}
