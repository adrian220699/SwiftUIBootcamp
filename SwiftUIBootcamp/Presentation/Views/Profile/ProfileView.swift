//
//  ProfileView.swift
//  SwiftUIBootcamp
//
//  Created by Adrian Flores Herrera on 7/10/26.
//

import SwiftUI

struct ProfileView: View {

    var body: some View {

        NavigationStack {
            
            ScrollView {
                
                VStack {
                    
                    HStack(spacing: 16) {
                        
                        ZStack (alignment: .bottomTrailing){
                            Image(systemName: "person.circle.fill")
                                .font(.system(size: 90))
                                .foregroundStyle(.blue)
                            Circle()
                                .fill(.green)
                                .frame(width: 18, height: 18)
                                .offset(x: 4, y: 4)
                        }
                        
                        VStack(alignment: .leading, spacing: 4) {
                            
                            Text("Adrian Flores")
                                .font(.title2)
                                .fontWeight(.bold)
                            
                            Text("iOS Developer")
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                        }
                        
                        Spacer()
                    }
                    
                    Divider()
                    
                    ProfileInfo()
                    
                    Divider()
                    
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        
                        Text("Editar Perfil")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color(uiColor: .secondarySystemBackground))
                            .foregroundStyle(.primary)
                            .clipShape(
                                RoundedRectangle(cornerRadius: 25)
                            )
                    }
                    .buttonStyle(.plain)
                }
                .padding()
                .navigationTitle("Mi Perfil")
            }
        }
    }
}

#Preview {
    ProfileView()
}
