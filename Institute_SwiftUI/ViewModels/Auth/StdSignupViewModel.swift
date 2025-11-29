//
//  StdSignupViewModel.swift
//  Institute_SwiftUI
//
//  Created by Ali Mansour on 28/11/2025.
//

import Foundation
import Combine
import SwiftData

@MainActor
final class StdSignupViewModel: ObservableObject {
    @Published var fname: String = ""
    @Published var lname: String = ""
    @Published var phone: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    
    @Published var university: University?
    
    @Published var isLoading: Bool = false
    @Published var signupError: String = ""
    
    private let authservice = AuthService()
    
    func signup(context: ModelContext, auth: AuthSession) async {
        signupError = ""
        
        let trimmedEmail = email.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmedEmail.isEmpty, !password.isEmpty, !phone.isEmpty, !fname.isEmpty, !lname.isEmpty else {
            signupError = AppStrings.LoginSignupViewModelError.emptyFields
            return
        }
        guard let selectedUniversity = university else {
            signupError = AppStrings.LoginSignupViewModelError.selectUniversity
            return
        }
        
        guard trimmedEmail.isValidEmail else {
            signupError = AppStrings.LoginSignupViewModelError.invalidEmail
            return
        }
        
        guard password.isStrongPassword else{
            signupError = AppStrings.LoginSignupViewModelError.weakPassword
            return
        }
        
        isLoading = true
        defer{ isLoading = false}
        
        do {
            let student = try await authservice.signupStudent(fname: fname, lname: lname, Phone: phone, email: trimmedEmail, password: password, university: selectedUniversity, context: context)
            auth.loginStudent(student)
        }
        catch{
            if let authError = error as? AuthError {
                signupError = authError.localizedDescription
            } else {
                signupError = AppStrings.LoginSignupViewModelError.unexpectedError
            }
        }
    }
}
