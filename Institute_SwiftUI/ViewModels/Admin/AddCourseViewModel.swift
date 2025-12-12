//
//  AddCourseViewModel.swift
//  Institute_SwiftUI
//
//  Created by Ali Mansour on 11/12/2025.
//

import SwiftUI
import SwiftData
import Combine

@MainActor
final class AddCourseViewModel: ObservableObject {
    @Published var title: String = ""
    @Published var isLoading: Bool = false
    @Published var error: String?
    
    func AddCourse(context: ModelContext){
        error = nil
        
        let trimmedTitle = title.trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard !trimmedTitle.isEmpty else {
            error = "Please enter a course title."
            return
        }
        
        isLoading = true
        defer{ isLoading = false}
        
        do{
            guard try CourseExists(context: context, title: trimmedTitle) == false else {
                error = "A course with this title already exists."
                return
            }
            
            let course = Course(title: trimmedTitle)
            context.insert(course)
        }catch let err{
            error = "An error occured"
            print("AddCourseViewModel: \(err)")
        }
    }
    
    private func CourseExists(context: ModelContext, title: String) throws -> Bool {
        let course = FetchDescriptor<Course>(predicate: #Predicate {$0.title == title})
        
        let result = try context.fetch(course)
        return result.isEmpty == false
    }
    
}
