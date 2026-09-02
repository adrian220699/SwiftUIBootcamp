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

            VStack {

                HStack(spacing: 16) {

                    Image(systemName: "person.circle.fill")
                        .font(.system(size: 90))
                        .foregroundStyle(.blue)

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

#Preview {
    ProfileView()
}
