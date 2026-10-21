//
//  UserProfile.swift
//  SwiftUIBootcamp
//
//  Created by Adrian Flores Herrera on 10/21/26.
//

import Foundation

struct UserProfile : Identifiable {
    
    let id : UUID
    var name : String
    var role : ExperienceLevel
    var isOnline : Bool
    var email : String
    var phoneNumber : String
    var address : String
    
    // Constructor con valores por defecto para instanciación limpia
    
    init(
        id : UUID = UUID(),
        name : String,
        role : ExperienceLevel,
        isOnline : Bool = true,
        email : String,
        phoneNumber : String,
        address : String
    ) {
        self.id = id
        self.name = name
        self.role = role
        self.isOnline = isOnline
        self.email = email
        self.phoneNumber = phoneNumber
        self.address = address
    }
    
}

extension UserProfile {
    
    
    static let mock = UserProfile(
        
        name: "Adrian Flores Herrera",
        role: .junior,
        email: "adrian@example.com",
        phoneNumber: "00 0000 0000",
        address : "Zacatepec Morelos, Mexico"
        
    )
}

