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
    @Binding var name : String
    @Binding var role : ExperienceLevel
    @Binding var isOnline : Bool
    @Binding var email : String
    @Binding var phoneNumber : String
    @Binding var address : String
    @State private var securityPin : String = ""
    
    
    
    var body: some View {
        
        NavigationStack {
            
            Form {
                
                // Seccion 1: Campo de texto regular
                Section ("Datos Personales") {
                    
                    TextField("Nombre completo", text: $name)
                    TextField("Correo Electronico", text: $email)
                    TextField("Numero", text: $phoneNumber)
                    TextField("Dirección", text: $address)
                }
                
                //Seccion 2: Selector y Switch Nativo
                Section("Perfil Profesional") {
                    
                    Picker("Nivel de experiencia", selection: $role) {
                        ForEach(ExperienceLevel.allCases) { level in
                            Text(level.rawValue).tag(level)
                            
                        }
                    }
                    
                    Toggle("Disponible para trabajar", isOn : $isOnline)
                    
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
    EditProfileView(name: .constant("Adrian Flores Herrera"),
                    role: .constant(.junior),
                    isOnline: .constant(true),
                    email: .constant("ddddd@outlook.com"),
                    phoneNumber: .constant("+56 0000 0000"),
                    address: .constant("Taltizapan 100, 00000 Zacatepec Morelos"))
}
