//
//  Untitled.swift
//  SwiftUIBootcamp
//
//  Created by Adrian Flores Herrera on 9/23/26.
//
import SwiftUI

struct ProfileHeader: View {
    let name: String
    let role: ExperienceLevel
    let isOnline: Bool
    let avatarColor: Color // Nombre corregido y más semántico
    
    var body: some View {
        HStack(spacing: 16) {
            ZStack(alignment: .bottomTrailing) {
                Image(systemName: "person.circle.fill")
                    .font(.system(size: 90))
                    .foregroundStyle(avatarColor)
                Circle()
                    .fill(isOnline ? .green : .red)
                    .frame(width: 18, height: 18)
                    .offset(x: 4, y: 4)
            }
            
            VStack(alignment: .leading, spacing: 4) {
                Text(name)
                    .font(.title2)
                    .fontWeight(.bold)
                
                Text(role.rawValue)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            
            Spacer()
        }
    }
}

 //MARK: - Extensión en la capa de Presentación para convertir la entidad de Dominio en un Color de SwiftUI

extension PhotoUserSelector {
    var color: Color {
        switch self {
        case .blue: return .blue
        case .green: return .green
        case .yellow: return .yellow
        case .pink: return .pink
        case .red: return .red
        }
    }
}


#Preview {
    ProfileHeader(
        name: "Adrian Flores Herrera",
        role: .junior,
        isOnline: true,
        avatarColor: .blue
    )
}
