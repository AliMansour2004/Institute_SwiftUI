//
//  AuthViewModel.swift
//  Institute_SwiftUI
//
//  Created by Ali Mansour on 24/11/2025.
//

import SwiftUI
import SwiftData
import Combine

@MainActor
final class AuthViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    
    @Published var fname: String = ""
    @Published var lname: String = ""
    @Published var phone: String = ""
    @Published var university: University?
    
    @Published var errorMessage: String?
    @Published var isLoading: Bool = false
    
    private let authService = AuthService()
    
    func login(context: ModelContext, session: AuthSession) async throws {
        isLoading = true
        errorMessage = nil
        defer { isLoading = false }
        
        let result = try await authService.login(email: email, password: password, context: context)
        
        switch result {
        case .student(let student):
            session.loginStudent(student)
        case .instructor(let instructor):
            session.loginInstructor(instructor)
        case .admin(let admin):
            session.loginAdmin(admin)
        }
            
    }
    
    func signupStudent(context: ModelContext, session: AuthSession) async {
        isLoading = true
        errorMessage = nil
        
        guard let university = university else {
            errorMessage = AppStrings.AuthViewModelError.selectUni
            isLoading = false
            return
        }
        
        do{
            let student = try await authService.signupStudent(fname: fname, lname: lname, Phone: phone, email: email, password: password, university: university, context: context)
            
            session.loginStudent(student)
        }
        catch {
            errorMessage = error.localizedDescription
        }
        
        isLoading = false
    }
    
    func signupInstructor(context: ModelContext, session: AuthSession) async {
        isLoading = true
        errorMessage = nil
        
        do {
            let instructor = try await authService.signupInstructor(fname: fname, lname: lname, Phone: phone, email: email, password: password, context: context)
            
            session.loginInstructor(instructor)
        }
        catch{
            errorMessage = error.localizedDescription
        }
        
        isLoading = false
    }
    
    func logout(session: AuthSession){
        authService.logout()
        session.logout()
        clearFields()
    }
    
    func clearFields(){
        fname = ""
        lname = ""
        phone = ""
        email = ""
        password = ""
        university = nil
        errorMessage = nil
    }
    
}
