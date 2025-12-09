//
//  Welcome.swift
//  Institute_SwiftUI
//
//  Created by Ali Mansour on 29/11/2025.
//

import SwiftUI
import SwiftData


struct Welcome: View {
    @EnvironmentObject var session: AuthSession
    @Environment(\.modelContext) private var context
    
    var body: some View {
        NavigationStack{
            VStack{
                Text(AppStrings.Welcome.Welcome)
                    .font(.largeTitle)
                
                Text(AppStrings.Welcome.WelcomeSubtitle)
                    .font(.largeTitle)
                
                Image(AppStrings.Welcome.WelcomeImg)
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(30)
                
                NavigationLink(destination: LoginView()) {
                    Text(AppStrings.Welcome.LoginButton)
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .foregroundStyle(.white)
                        .cornerRadius(15)
                }
                .padding(.top, 20)
                
                Spacer()
            } //vstack
            .padding()
            .task {
                await ensureDefaultAdminExists()
            }
        } //navigationStack
    } //body
    
    private func ensureDefaultAdminExists() async {
            let fetch = FetchDescriptor<Admin>()
            let admins = (try? context.fetch(fetch)) ?? []
            
            if admins.isEmpty {
                let admin = Admin()
                context.insert(admin)
            }
        }
    
}


#Preview {
    Welcome()
}
