//
//  ProfileInfo.swift
//  SwiftUIBootcamp
//
//  Created by Adrian Flores Herrera on 9/2/26.
//

import SwiftUI

struct ProfileInfo: View {
    var body: some View {
        
        VStack {
            InfoRow(icon: "envelope.fill" , text: "adrian@outlook.com")
            InfoRow(icon: "iphone.gen1", text: "+52 55 1234 5678")
            InfoRow(icon: "location.fill", text: "Cuauhtémoc, Ciudad de México")
        }
        
    }
}

#Preview {
    ProfileInfo()
}
