//
//  CustomButton.swift
//  SwiftUIBootcamp
//
//  Created by Adrian Flores Herrera on 9/23/26.
//

import SwiftUI

struct CustomButton: View {
    
    let title: String
    var icon: String? = nil
    var backgroundColor: Color = Color(uiColor: .secondarySystemBackground)
    var foregroundColor: Color = .primary
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: 8) {
                if let icon {
                    Image(systemName: icon)
                }
                Text(title)
                    .fontWeight(.semibold)
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(backgroundColor)
            .foregroundStyle(foregroundColor)
            .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    CustomButton(title: "Editar Perfil", icon: "pencil") {
        print("Boton presionado")
    }
}
