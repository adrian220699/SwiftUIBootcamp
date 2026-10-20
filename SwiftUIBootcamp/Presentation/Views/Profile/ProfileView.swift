//
//  ProfileView.swift
//  SwiftUIBootcamp
//
//  Created by Adrian Flores Herrera on 7/10/26.
//

import SwiftUI

struct ProfileView: View {
    
    @State private var isEditing : Bool = false
    @State private var name : String = "Adrian Flores Herrera"
    @State private var role : String = "iOS Developer"
    
    

    var body: some View {

        NavigationStack {
            
            ScrollView {
                
                VStack (spacing: 20){
                    
                    ProfileHeader(name: $name,
                                  role: $role,
                                  isEditing: isEditing)
                    
                    
                    //1. Mostrar/Ocultar vistas condicionalmente segun el estado
                    
                    if isEditing {
                        
                        Text("Modo edición activado")
                            .font(.subheadline)
                            .foregroundStyle(.blue)
                    }
                    
                    CustomCard {
                        
                        ProfileInfo()

                    }
                    
    
                    Spacer()
                    
                    // 2. Parametros dinamicos y mutación dentro del closure
                  
                    CustomButton(title: isEditing ? "Guardar Cambios" : "Editar Perfil",
                                 icon: isEditing ? "checkmark" : "pencil") {
                        
                        isEditing.toggle()
                    }
                  
                }
                .padding()
                .navigationTitle("Mi Perfil")
            }
        }
    }
}

#Preview {
    ProfileView()
}
