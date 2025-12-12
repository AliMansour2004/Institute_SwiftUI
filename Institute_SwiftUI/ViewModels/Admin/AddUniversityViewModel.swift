//
//  AddUniversityViewModel.swift
//  Institute_SwiftUI
//
//  Created by Ali Mansour on 10/12/2025.
//

import SwiftUI
import SwiftData
import Combine

@MainActor
final class AddUniversityViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var isLoading: Bool = false
    @Published var error: String?
    
    func AddUniversity(context: ModelContext) {
        error = nil
        
        let trimmedName = name.trimmingCharacters(in: .whitespacesAndNewlines)

        guard !trimmedName.isEmpty else {
            error = "University name can't be empty."
            return
        }
        
        isLoading = true
        defer{isLoading = false}
        
        do{
            guard try !universityExists(name: trimmedName, context: context) else { //Continue only if the university does NOT exist.
                error = "University already exists."
                return
            }
            
            let university = University(name: trimmedName)
            context.insert(university)
        }catch let err {
            error = "Unexpected error while creating university."
            print("AddUniversityViewModel error:", err) //error from console for debug(try to remove the throws from the private func here)
        }
        
    }
    
    private func universityExists(name: String, context: ModelContext) throws -> Bool {
        let university = FetchDescriptor<University>(
            predicate: #Predicate { $0.name == name }
        )
        
        let results = try context.fetch(university)
        return results.isEmpty == false
    }
}
