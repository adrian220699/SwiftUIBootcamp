//
//  ProfileViewModel.swift
//  SwiftUIBootcamp
//
//  Created by Adrian Flores Herrera on 10/21/26.
//
import Foundation
import Observation

@Observable
@MainActor
final class ProfileViewModel {
    
    //MARK: - Estado Observable
    
    var user : UserProfile
    var showEditModal : Bool = false
    
    var securityPin: String = "" 
    
    //MARK: - Estados Asíncronos y Feedback
    
    var isLoading: Bool = false
    var errorMessage: String? = nil
    var showSuccessAlert: Bool = false
    
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
    
  // Regla maestra : todos los campos requeridos deben ser validos
    
    var isFormValid : Bool {
        
        isNameValid && isEmailValid && isPinValid
    }
    
    // MARK: - Validaciones de PIN
        
        // 1. Exactamente 4 caracteres y todos numéricos
        var hasValidLength: Bool {
            securityPin.count == 4 && securityPin.allSatisfy(\.isNumber)
        }
        
        // 2. Comprueba si los 4 dígitos son idénticos (ej. "0000", "1111", "2222")
        var hasRepeatedDigits: Bool {
            guard hasValidLength else { return false }
            return Set(securityPin).count == 1
        }
        
        // 3. Válido si tiene 4 números Y NO son repetidos
        var isPinValid: Bool {
            hasValidLength && !hasRepeatedDigits
        }
    
    //MARK: - Intenciones del Usuario (Lógica de Presentación)
    
    func openEditModal() {
        securityPin = "" //Limpiamos el PIN al abrir
         errorMessage = nil
         showEditModal = true
        
    }
    
    func closeEditModal() {
        showEditModal = false
    }
    
    func toggleOnlineStatus() {
        user.isOnline.toggle()
    }
    
    //MARK: - Operación Asíncrona (Simulación de Red / Guardado)
    
    func saveChanges() async {
        guard isFormValid else { return }
        
        isLoading = true
        errorMessage = nil
        
        do {
            
            //Simulamos 1.5 segundos de latencia de red
            try await Task.sleep(for: .seconds(1.0))
            
            // Regla de simulación de error : Si el PIN ingresado es "0000", lanzamos error de autorización
            
            if hasRepeatedDigits {
                throw NSError(
                    domain: "AuthSecurity",
                    code: 422,
                    userInfo: [NSLocalizedDescriptionKey: "PIN demasiado debil. No uses digitos consecutivos"]
                )
            }
            
            //Éxito: apagamos spinner, cerramos modal y disparamos alerta de confirmación
            
            isLoading = false
            showEditModal = false
            
        } catch {
            isLoading = false
            errorMessage = error.localizedDescription
        }
    
    }
    
}
