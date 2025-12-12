//
//  AdminRolesViewModel.swift
//  Institute_SwiftUI
//
//  Created by Ali Mansour on 09/12/2025.
//

import SwiftUI
import Combine

@MainActor
final class AdminRolesViewModel: ObservableObject {
    
    enum roleType{
            case instructor, student
    }
    
    @Published var currentRole: roleType = .instructor
    
    var navigationTitle: String {
        switch currentRole {
        case .instructor:
            return "Instructors"
        case .student:
            return "Students"
        }
    }
    
    func showInstructors() {
        currentRole = .instructor
    }
    
    func showStudents() {
        currentRole = .student
    }
    
}
