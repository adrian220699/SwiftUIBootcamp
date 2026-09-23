//
//  PrimaryButtonModifier.swift
//  SwiftUIBootcamp
//
//  Created by Adrian Flores Herrera on 9/23/26.
//

import SwiftUI


struct PrimaryButtonModifier : ViewModifier {
    
    var backgroundColor: Color = Color(uiColor: .secondarySystemBackground)
    
    func body(content: Content) -> some View {
        content
                .frame(maxWidth: .infinity)
                .padding()
                 // 1. Usamos la propiedad dinámica aquí 🎨
                .background(backgroundColor)
                .foregroundStyle(.primary)
                .clipShape(RoundedRectangle(cornerRadius: 25))
        
    }
    
}

extension View {
    // 2. Le permitimos al método recibir el color opcionalmente (con un valor por defecto)
    func primaryButtonStyle(backgroundColor: Color = Color(uiColor: .secondarySystemBackground)) -> some View {
        modifier(PrimaryButtonModifier(backgroundColor: backgroundColor))
    }
    
}
