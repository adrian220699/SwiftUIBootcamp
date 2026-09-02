//
//  InfoRow.swift
//  SwiftUIBootcamp
//
//  Created by Adrian Flores Herrera on 9/2/26.
//

import SwiftUI

struct InfoRow: View {
    
    let icon : String
    let text : String
    
    var body: some View {

        HStack {
            
            Image(systemName: icon)
            
            Text(text)
            
            Spacer()
        }
        
    }
}

#Preview {
    InfoRow(
        icon: "envelope.fill",
        text: "adrian@outlook.com"
    )
}
