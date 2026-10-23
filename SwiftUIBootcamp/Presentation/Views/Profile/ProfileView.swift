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
                                  isOnline: viewModel.user.isOnline,
                                 avatarColor: viewModel.user.photoUser.color)

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
                .sheet(isPresented: $viewModel.showEditModal, onDismiss: {
                    
                    //Si la modal se cerro con exito (sin errores y sin estar cargando), mostramos la alerta
                    if viewModel.errorMessage == nil && !viewModel.isLoading && viewModel.isFormValid {
                        
                        viewModel.showSuccessAlert = true
                    }
                    
                
                }) {
                
                    EditProfileView(viewModel: viewModel)
                    
                }
                
                .alert("Perfil Actualizado", isPresented: $viewModel.showSuccessAlert) {
                    Button("Aceptar", role: .cancel) {}
                } message: {
                    Text("Los cambios se han guardado exitosamente.")
                }
            }
        }
    }
}

#Preview {
    ProfileView()
}
