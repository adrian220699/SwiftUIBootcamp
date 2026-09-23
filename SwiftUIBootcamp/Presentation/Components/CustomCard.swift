//
//  CustomCard.swift
//  SwiftUIBootcamp
//
//  Created by Adrian Flores Herrera on 9/23/26.
//

import SwiftUI

struct CustomCard<Content: View>: View {

    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        
        VStack(alignment: .leading) {
            content
        }
        
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(uiColor: .secondarySystemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 16))
    
    }
    
}


#Preview {
    CustomCard {
        VStack(alignment: .leading, spacing: 8) {
            Text("Tarjeta de Prueba")
                .font(.headline)
            Text("Este es un texto dentro de nuestra CustomCard para verificar el diseño")
                .font(.subheadline)
                .foregroundStyle(.secondary)
                
        }
    }
    
    .padding()
    
}
