//
//  EditProfileView.swift
//  SwiftUIBootcamp
//
//  Created by Adrian Flores Herrera on 10/20/26.
//

import SwiftUI

struct EditProfileView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    // Recibimos el ViewModel para sincronizar cambios y leer validaciones
    @Bindable var viewModel: ProfileViewModel
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Datos Personales") {
                    
                    TextField("Nombre completo", text: $viewModel.user.name)
                    
                    TextField("Correo Electrónico", text: $viewModel.user.email)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                    
                    TextField("Teléfono", text: $viewModel.user.phoneNumber)
                        .keyboardType(.phonePad)
                    
                    TextField("Dirección", text: $viewModel.user.address)
                    
                    Picker("Color de foto de perfil", selection: $viewModel.user.photoUser) {
                        ForEach(PhotoUserSelector.allCases) { photoOption in
                            Text(photoOption.rawValue).tag(photoOption)
                        }
                    }
                    
                }
                
                Section("Perfil Profesional") {
                    Picker("Nivel de experiencia", selection: $viewModel.user.role) {
                        ForEach(ExperienceLevel.allCases) { level in
                            Text(level.rawValue).tag(level)
                        }
                    }
                    
                    Toggle("Disponible para trabajar", isOn: $viewModel.user.isOnline)
                }
                
                Section(header: Text("Seguridad"), footer: Text(pinFooterText)) {
                    SecureField("PIN de seguridad (4 dígitos)", text: $viewModel.securityPin)
                        .keyboardType(.numberPad)
                }
            }
            .navigationTitle("Editar Perfil")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancelar") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Listo") {
                        viewModel.saveChanges()
                        dismiss()
                    }
                    .fontWeight(.bold)
                    // Deshabilitación reactiva gobernada por el ViewModel:
                    .disabled(!viewModel.isFormValid)
                }
            }
        }
    }
    
    // Mensaje dinámico de ayuda según el estado del PIN
    private var pinFooterText: String {
        if viewModel.securityPin.isEmpty {
            return "Ingresa un PIN de 4 dígitos para autorizar cambios."
        } else if !viewModel.isPinValid {
            return "El PIN debe contener exactamente 4 números."
        } else {
            return "PIN válido."
        }
    }
}

#Preview {
    EditProfileView(viewModel: ProfileViewModel())
}
