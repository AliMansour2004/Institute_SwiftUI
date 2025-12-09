//
//  LoginViewModel.swift
//  Institute_SwiftUI
//
//  Created by Ali Mansour on 24/11/2025.
//

//  LoginView (UI)
//      ↓ calls
//  LoginViewModel (validation & flow control)
//      ↓ calls
//  AuthService.login (checks keychain + SwiftData)
//      ↓ returns
//  AuthViewModel.loginStudent / loginInstructor
//      ↓ updates UI
//  IndexView switches to StudentTabView or InstructorTabView

import SwiftData
import SwiftUI
import Combine

@MainActor
final class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var loginError: String = ""
    @Published var isLoading: Bool = false
    
    private let authVM = AuthViewModel()
    
    func login(context: ModelContext, session: AuthSession) async {
        loginError = ""
        
        let trimmedEmail = email.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmedEmail.isEmpty, !password.isEmpty else {
            loginError = AppStrings.LoginSignupViewModelError.emptyFields
            return
        }
        
        isLoading = true
        defer { isLoading = false }
        
        do{
            authVM.email = trimmedEmail
            authVM.password = password
            
            try await authVM.login(context: context, session: session)
        }
        catch{
            if let authError = error as? AuthError {
                loginError = authError.localizedDescription
            } else {
                loginError = AppStrings.LoginSignupViewModelError.unexpectedError
            }
        }
    }
}
