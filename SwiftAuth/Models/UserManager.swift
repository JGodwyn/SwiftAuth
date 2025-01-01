//
//  UserManager.swift
//  SwiftAuth
//
//  Created by Gdwn on 30/12/2024.
//

import Foundation


struct User {
    var username : String
    var age : Double
    var bio : String
    
    static var emptyUser = User(username: "",
                                age: 18,
                                bio: "")
}

struct UserValidation {
    enum Errors : LocalizedError {
        case emptyUsername
        case emptyBio
        case usernameExists
        case bioTooShort
        
        var errorDescription: String? {
            switch self {
                case .emptyUsername :
                    return "⚠️ You didn't add a username"
                case .emptyBio :
                    return "⚠️ You didn't add a bio"
                case .usernameExists:
                    return "⚠️ This username already exists"
                case .bioTooShort:
                    return "⚠️ Your bio is too short, add more content"
            }
        }
    }
}

final class UserClass : ObservableObject {
    @Published var userManager : User = .emptyUser
    
    @Published var hasError : Bool = false // show alert on the screen
    @Published var userErrorManager : UserValidation.Errors? // what the error reads from
    
    @Published var acceptedTerms : Bool = false // for the terms and conditions
    
    func validateUsername() {
        hasError = userManager.username.isEmpty
        userErrorManager = hasError ? .emptyUsername : nil
    }
    
    func validateBio() {
        hasError = userManager.bio.isEmpty
        userErrorManager = hasError ? .emptyBio : nil
    }
}
