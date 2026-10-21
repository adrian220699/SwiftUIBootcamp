//
//  ProfileInfo.swift
//  SwiftUIBootcamp
//
//  Created by Adrian Flores Herrera on 9/2/26.
//
import SwiftUI

struct ProfileInfo: View {
    let email: String
    let phoneNumber: String
    let address: String
    
    var body: some View {
        VStack(spacing: 12) {
            InfoRow(icon: "envelope.fill", text: email)
            InfoRow(icon: "iphone.gen1", text: phoneNumber)
            InfoRow(icon: "location.fill", text: address)
        }
    }
}

#Preview {
    ProfileInfo(
        email: "ddddd@outlook.com",
        phoneNumber: "+56 0000 0000",
        address: "Taltizapan 100, 00000 Zacatepec Morelos"
    )
}
