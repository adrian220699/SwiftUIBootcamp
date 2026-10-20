//
//  Untitled.swift
//  SwiftUIBootcamp
//
//  Created by Adrian Flores Herrera on 9/23/26.
//

import SwiftUI

struct ProfileHeader: View {
    
    // 1.- Conexión bidireccional al estado que vive en ProfileView
    
    @Binding var name : String
    @Binding var role : String
    
    let isEditing : Bool
    var isOnline : Bool = false
    
    var body: some View {
        
        HStack(spacing: 16) {
            
            ZStack (alignment: .bottomTrailing){
                Image(systemName: "person.circle.fill")
                    .font(.system(size: 90))
                    .foregroundStyle(.blue)
                Circle()
                    .fill(isOnline ? .green : .red)
                    .frame(width: 18, height: 18)
                    .offset(x: 4, y: 4)
            }
            
            VStack(alignment: .leading, spacing: 8) {
                
                // 2.- Si estamos editando, mostramos TextField, si no, text normal
                
                if isEditing {
                    TextField("Nombre", text: $name)
                        .textFieldStyle(.roundedBorder)
                    TextField("Rol", text: $role)
                        .textFieldStyle(.roundedBorder)
                } else {
                    Text(name)
                        .font(.title2)
                        .fontWeight(.bold)
                    Text(role)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
                
                
            }
            
            Spacer()
        }
        
    }
    
}


#Preview {
    ProfileHeader(
        name: .constant("Adrian Flores Herrera"),
        role: .constant("iOS Developer"),
        isEditing: false
    )
}
