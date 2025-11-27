//
//  AuthService.swift
//  Institute_SwiftUI
//
//  Created by Ali Mansour on 24/11/2025.
//

import Foundation
import SwiftData

enum AuthUser{
    case student(Student)
    case instructor(Instructor)
}

enum AuthError: Error, LocalizedError {
    case wrongPassword
    case userNotFound
    case emailTaken

    var errorDescription: String? {
        switch self {
        case .wrongPassword: return AppStrings.AuthServiceError.wrongPassword
        case .userNotFound: return AppStrings.AuthServiceError.userNotFound
        case .emailTaken: return AppStrings.AuthServiceError.emailTaken
        }
    }
}

final class AuthService{
    
    func login(email: String, password: String, context: ModelContext)
     async throws -> AuthUser {
        
        guard let savedPassword = KeychainHelper.shared.readPassword(email: email), savedPassword == password else {
            throw AuthError.wrongPassword
        }
        
        let studentFetch = studentFetch(email: email)
        if let student = try? context.fetch(studentFetch).first {
            return .student(student)
        }
        
        let instructorFetch = instructorFetch(email: email)
        if let instructor = try? context.fetch(instructorFetch).first {
            return .instructor(instructor)
        }
        
        throw AuthError.userNotFound
    }
    
    func signupStudent(fname: String, lname: String, Phone: String, email: String, password: String, university: University, context: ModelContext)
     async throws -> Student{
         
        if emailExists(email, context: context){
            throw AuthError.emailTaken
        }
        
        let student = Student(fname: fname, lname: lname, phone: Phone, email: email, university: university)
        context.insert(student)
        
        KeychainHelper.shared.savePassword(password, email: email)
        
        return student
        
    }
    
    func signupInstructor(fname: String, lname: String, Phone: String, email: String, password: String, context: ModelContext)
     async throws -> Instructor{
        
        if emailExists(email, context: context){
            throw AuthError.emailTaken
        }
         
         let instructor = Instructor(fname: fname, lname: lname, phone: Phone, email: email)
         context.insert(instructor)
         
         KeychainHelper.shared.savePassword(password, email: email)
         
         return instructor
    }
    
    func emailExists(_ email: String, context: ModelContext) -> Bool {

        let studentFetch = studentFetch(email: email)
        if let students = try? context.fetch(studentFetch), students.isEmpty == false {
            return true
        }

        let instructorFetch = instructorFetch(email: email)
        if let instructors = try? context.fetch(instructorFetch), instructors.isEmpty == false {
            return true
        }
        
        return false
    }
    
    func studentFetch(email: String) -> FetchDescriptor<Student> {
        return FetchDescriptor<Student>(predicate: #Predicate { $0.email == email })
    }
    
    func instructorFetch(email: String ) -> FetchDescriptor<Instructor> {
        return FetchDescriptor<Instructor>(predicate: #Predicate { $0.email == email })
    }
    
    func logout() { UserDefaults.standard.removeObject(forKey: "lastLoggedEmail") }
    
}


//func signupStudent(fname: String, lname: String, phone:String, email: String, uiversity: University, ){
//    
//}

