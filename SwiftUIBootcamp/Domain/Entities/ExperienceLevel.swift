//
//  ExperienceLevel.swift
//  SwiftUIBootcamp
//
//  Created by Adrian Flores Herrera on 10/20/26.
//

enum ExperienceLevel : String, CaseIterable, Identifiable {
    
    case junior = "Junior"
    case mid = "Mid - Level"
    case senior = "Senior"
    case lead = "Tech Lead"
    
    var id : String { self.rawValue}
    
    
}
