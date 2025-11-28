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
    
    private let authService = AuthService()
    
    func login(context: ModelContext, auth: AuthSession) async {
        loginError = ""
        
        let trimmedEmail = email.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmedEmail.isEmpty, !password.isEmpty else {
            loginError = AppStrings.LoginSignupViewModelError.emptyFields
            return
        }
        
        isLoading = true
        defer { isLoading = false }
        
        do{
            let result = try await authService.login(email: trimmedEmail, password: password, context: context)
            
            switch result {
            case.student(let student):
                auth.loginStudent(student)
            case.instructor(let instructor):
                auth.loginInstructor(instructor)
            }
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
