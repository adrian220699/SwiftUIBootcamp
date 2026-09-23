//
//  ProfileView.swift
//  SwiftUIBootcamp
//
//  Created by Adrian Flores Herrera on 7/10/26.
//

import SwiftUI

struct ProfileView: View {

    var body: some View {

        NavigationStack {
            
            ScrollView {
                
                VStack {
                    
                    ProfileHeader(name: "Adrian Flores Herrera", role: "iOS Developer")
                    
                    
                    CustomCard {
                        
                        ProfileInfo()

                    }
                    
                    
                    
                    Spacer()
                  
                    CustomButton(title: "Editar Perfil", icon: "pencil") {
                        
                        print("Boton presionado")
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
