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
                
                // Mensaje de Error en caso de falla
                
                if let error = viewModel.errorMessage {
                    
                    Section {
                        Label(error, systemImage: "exclamationmark.triangle.fill")
                            .foregroundStyle(.red)
                            .font(.subheadline)
                    }
                    
                }
                
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
                
                Section(
                    header: Text("Seguridad"),
                    footer: Text(pinFooterText).foregroundStyle(footerColor)
                ) {
                    SecureField("PIN de seguridad (4 dígitos)", text: $viewModel.securityPin)
                        .keyboardType(.numberPad)
                        .onChange(of: viewModel.securityPin) { oldValue, newValue in
                            // 1. Filtrar solo caracteres numéricos (por si pegan texto)
                            let digitsOnly = newValue.filter { $0.isNumber }
                            
                            // 2. Si supera los 4 dígitos, recortar al máximo de 4
                            if digitsOnly.count > 4 {
                                viewModel.securityPin = String(digitsOnly.prefix(4))
                            } else if digitsOnly != newValue {
                                // Si contenía letras o símbolos, dejamos solo los números
                                viewModel.securityPin = digitsOnly
                            }
                        }
                }
                
            }
            .disabled(viewModel.isLoading) //Bloquea interacción durante la carga
            .navigationTitle("Editar Perfil")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancelar") {
                        dismiss()
                    }
                    .disabled(viewModel.isLoading)
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    if viewModel.isLoading {
                        ProgressView()
                    } else {
                        Button("Listo") {
                            Task {
                                await viewModel.saveChanges()
                            }
                        }
                        .fontWeight(.bold)
                        // Deshabilitación reactiva gobernada por el ViewModel:
                        .disabled(!viewModel.isFormValid)
                    }
                }
            }
        }
    }
    
    // Mensaje dinámico de ayuda según el estado del PIN

    private var pinFooterText: String {
        if viewModel.securityPin.isEmpty {
            return "Ingresa un PIN de 4 dígitos para autorizar cambios."
            } else if viewModel.securityPin.count < 4 {
                return "Faltan \(4 - viewModel.securityPin.count) dígito(s)."
            } else if viewModel.hasRepeatedDigits {
            return "PIN inseguro: no se permiten dígitos idénticos repetidos (ej. 0000, 1111)."
        } else {
            return "PIN válido y seguro."
        }
    }
    
    private var footerColor: Color {
        if viewModel.isPinValid {
            return .green
        } else if viewModel.hasRepeatedDigits {
            return .red
        } else {
            return .secondary
        }
    }
    
}

#Preview {
    EditProfileView(viewModel: ProfileViewModel())
}
