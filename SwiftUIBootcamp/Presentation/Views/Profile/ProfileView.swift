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
                    
                    Button {
                        
                    } label: {
                        
                        Text("Editar Perfil")
                            .primaryButtonStyle()
                    }
                    .buttonStyle(.plain)
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
