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

final class UserClass : ObservableObject {
    @Published var userManager : User = .emptyUser
}
