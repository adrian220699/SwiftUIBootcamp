//
//  ProfileViewModel.swift
//  SwiftUIBootcamp
//
//  Created by Adrian Flores Herrera on 10/21/26.
//
import Foundation
import SwiftUI

@Observable
final class ProfileViewModel {
    
    //MARK: - Estado Observable
    
    var user : UserProfile
    var showEditModal : Bool = false
    var securityPin : String = ""
    
    
    //MARK: - Inicializador
    
    init(user : UserProfile = .mock) {
        self.user = user
    }
    
    //MARK: - Validaciones de Negocio (Propiedades Computadas)
    
    var isNameValid : Bool {
        
       return !user.name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
        
    }
    
    var isEmailValid : Bool {
        
        //Validación basica de estructura de correo
        
        let emailRegex = #"^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,64}$"#
        
        return user.email.range(of: emailRegex, options: .regularExpression) != nil
    }
    
    var isPinValid : Bool {
        
        //Debe tener exactamente 4 digitos numéricos
        
        securityPin.count == 4 && CharacterSet.decimalDigits.isSuperset(of: CharacterSet(charactersIn: securityPin))
    }
    
    // Regla maestra : todos los campos requeridos deben ser validos
    
    var isFormValid : Bool {
        
        isNameValid && isEmailValid && isPinValid
    }
    
    
    
    //MARK: - Intenciones del Usuario (Lógica de Presentación)
    
    func openEditModal() {
        securityPin = "" //Limpiamos el PIN al abrir
         showEditModal = true
    }
    
    func closeEditModal() {
        showEditModal = false
    }
    
    func toggleOnlineStatus() {
        user.isOnline.toggle()
    }
    
    func saveChanges() {
        guard isFormValid else { return }
        
        //Aqui conectaremos la persistencia o llamada a API
        closeEditModal()
    }
    
}
