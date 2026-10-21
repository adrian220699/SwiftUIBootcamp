//
//  ProfileView.swift
//  SwiftUIBootcamp
//
//  Created by Adrian Flores Herrera on 7/10/26.
//
import SwiftUI

struct ProfileView: View {
    
    // 1. Instanciamos el ViewModel con @State (estandar moderno @Observable)
    
    @State private var viewModel = ProfileViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                   
                    //2. Leemos directamente las propiedades desde el ViewModel
                    
                    ProfileHeader(name: viewModel.user.name,
                                  role: viewModel.user.role,
                                  isOnline: viewModel.user.isOnline)

                    CustomCard {
                        ProfileInfo(email: viewModel.user.email,
                                    phoneNumber: viewModel.user.phoneNumber,
                                    address: viewModel.user.address)
                    }
                    
                    Spacer()
                    
                    // 3. Ejecutamos la acción llamando al método del ViewModel
                  
                    CustomButton(title: "Editar Perfil", icon: "pencil") {
                        viewModel.openEditModal()
                    }
                }
                .padding()
                .navigationTitle("Mi Perfil")
                .sheet(isPresented: $viewModel.showEditModal) {
                    
                    // 4. Proyección del Binding con '$' directamente hacia el modelo
                    EditProfileView(user: $viewModel.user)
                }
            }
        }
    }
}

#Preview {
    ProfileView()
}
