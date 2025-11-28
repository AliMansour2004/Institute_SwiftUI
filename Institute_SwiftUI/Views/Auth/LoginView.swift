//
//  LoginView.swift
//  Institute_SwiftUI
//
//  Created by Ali Mansour on 24/11/2025.
//

import SwiftUI
import SwiftData

struct LoginView: View {
    @Environment(\.modelContext) private var context
    @EnvironmentObject var session: AuthSession
    
    @StateObject var vm = LoginViewModel()
    
    var body: some View {
        VStack(spacing: 24){
            
            Text(AppStrings.LoginView.title)
                .font(.largeTitle)
                .bold()
            
            TextField(AppStrings.LoginView.email, text: $vm.email)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.emailAddress)
                .autocorrectionDisabled()
                .textInputAutocapitalization(.never)
            
            SecureField(AppStrings.LoginView.password, text: $vm.password)
                .textFieldStyle(.roundedBorder)
            
            if !vm.loginError.isEmpty {
                Text(vm.loginError)
                    .foregroundColor(.red)
                    .font(.callout)
            }
            
            Button{
                Task {
                    await vm.login(context: context, auth: session)
                }
            }label: {
                if vm.isLoading {
                    ProgressView()
                }else{
                    Text(AppStrings.LoginView.signInButton)
                }
            }
            .buttonStyle(.borderedProminent)
            .padding(.top, 10)
            
            Spacer()
        }
        .padding()
        
    }
}

#Preview{
    LoginView()
}

