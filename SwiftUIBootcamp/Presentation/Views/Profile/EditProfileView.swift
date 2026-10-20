//
//  EditProfileView.swift
//  SwiftUIBootcamp
//
//  Created by Adrian Flores Herrera on 10/20/26.
//

import SwiftUI

struct EditProfileView : View {
    
    @State private var name : String = "Adrian Flores Herrera"
    @State private var selectedLevel : ExperienceLevel = .junior
    @State private var isOnline : Bool = true
    @State private var securityPin : String = ""
    
    var body: some View {
        
        Form {
            
            // Seccion 1: Campo de texto regular
            Section ("Datos Personales") {

                TextField("Nombre completo", text: $name)
            }
            
            //Seccion 2: Selector y Switch Nativo
            Section("Perfil Profesional") {
                
                Picker("Nivel de experiencia", selection: $selectedLevel) {
                    ForEach(ExperienceLevel.allCases) { level in
                        Text(level.rawValue).tag(level)
                        
                    }
                }
                
                Toggle("Disponible para trabajar", isOn: $isOnline)
                
            }
            
            //Seccion 3: Campo Oculto para contraseñas / PIN
            
            Section(header: Text("Seguridad"), footer: Text("El PIN debe tener 4 digitos.")) {
                SecureField("PIN de seguridad", text: $securityPin)
                    .keyboardType(.numberPad)
            }
            
        }
        
        .navigationTitle("Editar Perfil")
        
    }
    
}


#Preview {
    EditProfileView()
}
