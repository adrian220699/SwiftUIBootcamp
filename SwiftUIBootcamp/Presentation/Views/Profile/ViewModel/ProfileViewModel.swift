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
    
    //MARK: - Inicializador
    
    init(user : UserProfile = .mock) {
        self.user = user
    }
    
    //MARK: - Intenciones del Usuario (Lógica de Presentación)
    
    func openEditModal() {
        showEditModal = true
    }
    
    func closeEditModal() {
        showEditModal = false
    }
    
    func toggleOnlineStatus() {
        user.isOnline.toggle()
    }
    
}
