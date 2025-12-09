//
//  CourseListView.swift
//  Institute_SwiftUI
//
//  Created by Ali Mansour on 24/11/2025.
//

import SwiftUI
import SwiftData

struct CourseListView: View {
    @Query var courses: [Course]
    
    var body: some View {
        
        VStack{
            if courses.isEmpty {
                ContentUnavailableView {
                    Label("No Courses", systemImage: "book.closed")
                } description: {
                    Text("There is no courses to List")
                }
            } else {
                List(courses) { course in
                    Text(course.title)
                }
            }
            
        }
    }
}

#Preview {
    CourseListView()
}
