//
//  InsSignupViewModel.swift
//  Institute_SwiftUI
//
//  Created by Ali Mansour on 28/11/2025.
//

import Foundation
import Combine
import SwiftData

@MainActor
final class InsSignupViewModel: ObservableObject {
    @Published var fname: String = ""
    @Published var lname: String = ""
    @Published var phone: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    
    @Published var isLoading: Bool = false
    @Published var signupError: String = ""
    
    private let authservice = AuthService()
    
    func signup(context: ModelContext, session: AuthSession) async {
        signupError = ""
        
        let trimmedEmail = email.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmedEmail.isEmpty, !password.isEmpty, !phone.isEmpty, !fname.isEmpty, !lname.isEmpty else {
            signupError = AppStrings.LoginSignupViewModelError.emptyFields
            return
        }
        
        isLoading = true
        defer{ isLoading = false}
        
        do {
            let instructor = try await authservice.signupInstructor(fname: fname, lname: lname, Phone: phone, email: trimmedEmail, password: password, context: context)
            session.loginInstructor(instructor)
        }
        catch {
            if let authError = error as? AuthError {
                signupError = authError.localizedDescription
            } else {
                signupError = AppStrings.LoginSignupViewModelError.unexpectedError
            }
        }
    }
}
