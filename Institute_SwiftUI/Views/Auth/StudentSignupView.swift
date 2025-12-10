//
//  StudentSignupView.swift
//  Institute_SwiftUI
//
//  Created by Ali Mansour on 28/11/2025.
//

import SwiftUI
import SwiftData

struct StudentSignupView: View {
    @Environment(\.modelContext) private var context
    @EnvironmentObject var session: AuthSession
    
    @Query(sort: \University.name) private var universities: [University]
    
    @StateObject var vm = StdSignupViewModel()
    
    var body: some View {
        VStack(spacing: 13){
            Text(AppStrings.SignupView.StdTitle)
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
            
            Picker("Select University", selection: $vm.university) {
                Text(AppStrings.SignupView.uniSelect).tag(University?.none)
                
                ForEach(universities) { uni in
                    Text(uni.name).tag(University?.some(uni))
                }
            }
            .pickerStyle(.menu)
            
            if !vm.signupError.isEmpty {
                Text(vm.signupError)
                    .foregroundColor(.red)
                    .font(.callout)
            }
            
            Button {
                Task {
                    await vm.signup(context: context, auth: session)
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
            
        } //vstack
        .padding()
        Spacer()
    }
    
}

#Preview {
    StudentSignupView()
}
