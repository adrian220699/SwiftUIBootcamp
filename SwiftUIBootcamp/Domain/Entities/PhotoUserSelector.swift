//
//  PhotoUserSelector.swift
//  SwiftUIBootcamp
//
//  Created by Adrian Flores Herrera on 10/22/26.
//

import Foundation

enum PhotoUserSelector: String, CaseIterable, Identifiable {
    case blue = "Azul"
    case green = "Verde"
    case yellow = "Amarillo"
    case pink = "Rosa"
    case red = "Rojo"
    
    var id: String { self.rawValue }
}
