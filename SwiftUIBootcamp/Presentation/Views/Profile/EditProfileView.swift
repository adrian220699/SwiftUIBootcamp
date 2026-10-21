//
//  EditProfileView.swift
//  SwiftUIBootcamp
//
//  Created by Adrian Flores Herrera on 10/20/26.
//

import SwiftUI

struct EditProfileView : View {
    
    //Inyección de la acción de descarte provista por el entorno
    
    @Environment(\.dismiss) private var dismiss
    
    // Un unico Binding bidireccional a toda la entidad
    
    @Binding var user : UserProfile

    @State private var securityPin : String = ""
    
    
    
    var body: some View {
        
        NavigationStack {
            
            Form {
                
                // Seccion 1: Campo de texto regular
                Section ("Datos Personales") {
                    
                    TextField("Nombre completo", text: $user.name)
                    TextField("Correo Electronico", text: $user.email)
                    TextField("Numero", text: $user.phoneNumber)
                    TextField("Dirección", text: $user.address)
                }
                
                //Seccion 2: Selector y Switch Nativo
                Section("Perfil Profesional") {
                    
                    Picker("Nivel de experiencia", selection: $user.role) {
                        ForEach(ExperienceLevel.allCases) { level in
                            Text(level.rawValue).tag(level)
                            
                        }
                    }
                    
                    Toggle("Disponible para trabajar", isOn : $user.isOnline)
                    
                }
                                
                //Seccion 4: Campo Oculto para contraseñas / PIN
                
                Section(header: Text("Seguridad"), footer: Text("El PIN debe tener 4 digitos.")) {
                    SecureField("PIN de seguridad", text: $securityPin)
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
                        dismiss()
                    }
                    .fontWeight(.bold)
                }
            }
        }
    }
}


#Preview {
    EditProfileView(user: .constant(.mock))
}
