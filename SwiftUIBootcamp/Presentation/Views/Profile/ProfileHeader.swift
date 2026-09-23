//
//  Untitled.swift
//  SwiftUIBootcamp
//
//  Created by Adrian Flores Herrera on 9/23/26.
//

import SwiftUI

struct ProfileHeader: View {
    
    let name : String
    let role : String
    var isOnline : Bool = false
    
    var body: some View {
        
        HStack(spacing: 16) {
            
            ZStack (alignment: .bottomTrailing){
                Image(systemName: "person.circle.fill")
                    .font(.system(size: 90))
                    .foregroundStyle(.blue)
                Circle()
                    .fill(isOnline ? .green : .red)
                    .frame(width: 18, height: 18)
                    .offset(x: 4, y: 4)
            }
            
            VStack(alignment: .leading, spacing: 4) {
                
                Text(name)
                    .font(.title2)
                    .fontWeight(.bold)
                
                Text(role)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            
            Spacer()
        }
        
    }
    
}


#Preview {
    ProfileHeader(
        name: "Adrian Flores",
        role: "iOS Develope")
}
