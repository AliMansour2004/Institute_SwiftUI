//
//  AdminCourseView.swift
//  Institute_SwiftUI
//
//  Created by Ali Mansour on 01/12/2025.
//

import SwiftUI
import SwiftData

struct AdminCourseView: View {
    let admin: Admin
    @Query var courses: [Course]
    @EnvironmentObject var session: AuthSession
    @State private var showingAddUniversity: Bool = false
    
    var body: some View {
        
        VStack{
            Group {
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
            .toolbar{
                ToolbarItem(placement: .topBarTrailing){
                    Button{
                        showingAddUniversity = true
                    }label: {
                        Label("Add Course", systemImage: "plus")
                    }
                } //toolbarItem
            } //toolbar
            .sheet(isPresented: $showingAddUniversity){
                AddCourseView(admin: admin)
            }
        }
    }
}

#Preview {
    let admin = Admin()
    AdminTabView(admin: admin)
}

#Preview {
    let admin = Admin()
    AdminCourseView(admin: admin)
}




