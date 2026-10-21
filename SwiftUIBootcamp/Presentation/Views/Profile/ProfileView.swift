//
//  ProfileView.swift
//  SwiftUIBootcamp
//
//  Created by Adrian Flores Herrera on 7/10/26.
//
import SwiftUI

struct ProfileView: View {
    
    @State private var name: String = "Adrian Flores Herrera"
    @State private var role: ExperienceLevel = .junior
    @State private var isOnline: Bool = true
    @State private var email: String = "ddddd@outlook.com"
    @State private var phoneNumber: String = "+56 0000 0000"
    @State private var address: String = "Taltizapan 100, 00000 Zacatepec Morelos"
    @State private var showEditModal: Bool = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    ProfileHeader(name: name, role: role, isOnline: isOnline)
                    
                    CustomCard {
                        ProfileInfo(email: email, phoneNumber: phoneNumber, address: address)
                    }
                    
                    Spacer()
                  
                    CustomButton(title: "Editar Perfil", icon: "pencil") {
                        showEditModal = true
                    }
                }
                .padding()
                .navigationTitle("Mi Perfil")
                .sheet(isPresented: $showEditModal) {
                    EditProfileView(
                        name: $name,
                        role: $role,
                        isOnline: $isOnline,
                        email: $email,
                        phoneNumber: $phoneNumber,
                        address: $address
                    )
                }
            }
        }
    }
}

#Preview {
    ProfileView()
}
