//
//  InstructorSignupView.swift
//  Institute_SwiftUI
//
//  Created by Ali Mansour on 24/11/2025.
//

import SwiftUI
import SwiftData

struct InstructorSignupView: View {
    @Environment(\.modelContext) private var context
    @EnvironmentObject var session: AuthSession
        
    @StateObject var vm = InsSignupViewModel()
    
    var body: some View {
        VStack(spacing: 13){
            Text(AppStrings.SignupView.InsTitle)
                .font(.largeTitle)
                .bold()
                .padding(.bottom, 30)
            
            TextField(AppStrings.SignupView.fname, text: $vm.fname)
                .textFieldStyle(.roundedBorder)
            
            TextField(AppStrings.SignupView.lname, text: $vm.lname)
                .textFieldStyle(.roundedBorder)
            
            TextField(AppStrings.SignupView.phone, text: $vm.phone)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.phonePad)
            
            TextField(AppStrings.SignupView.email, text: $vm.email)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.emailAddress)
                .autocorrectionDisabled()
                .textInputAutocapitalization(.never)
            
            SecureField(AppStrings.SignupView.password, text: $vm.password)
                .textFieldStyle(.roundedBorder)
            
            if !vm.signupError.isEmpty {
                Text(vm.signupError)
                    .foregroundColor(.red)
                    .font(.callout)
            }
            
            Button {
                Task {
                    await vm.signup(context: context, session: session)
                }
            } label: {
                if vm.isLoading {
                    ProgressView()
                } else {
                    Text(AppStrings.SignupView.createButton)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }
            }
            .padding(.top, 20)
            
        } //vstack
        .padding()
        Spacer()
    }
}

#Preview{
    InstructorSignupView()
}
