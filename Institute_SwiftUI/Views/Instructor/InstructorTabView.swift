//
//  ّInstructorTabView.swift
//  Institute_SwiftUI
//
//  Created by Ali Mansour on 29/11/2025.
//

import SwiftUI

struct InstructorTabView: View {
    let instructor: Instructor
    @EnvironmentObject var session: AuthSession
    
    enum InstructorTab: Hashable {
        case home, courses ,profile, settings
    }
    
    @State private var selectedTab: InstructorTab = .home
    
    var body: some View {
        TabView(selection: $selectedTab){
            
            NavigationStack{
                InstructorHomeView(instructor: instructor)
                    .navigationTitle("Dashboard")
            }.tabItem({
                Image(systemName: "house")
                Text("Home")
            })
            .tag(InstructorTab.home)
            
            NavigationStack{
                InstructorCourseView(instructor: instructor)
                    .navigationTitle("Courses")
            }.tabItem ({
                Image(systemName: "book")
                Text("Courses")
            })
            .tag(InstructorTab.courses)
            
            NavigationStack{
                InstructorProfileView(instructor: instructor)
                    .navigationTitle("Profile")
            }.tabItem({
                Image(systemName: "person")
                Text("Profile")
            })
            .tag(InstructorTab.profile)
            
            NavigationStack{
                InstructorsSettingsView(instruction: instructor)
                    .navigationTitle("Settings")
            }.tabItem({
                Image(systemName: "gearshape")
                Text("Settings")
            })
            .tag(InstructorTab.settings)
            
        }
    }
}

#Preview {
    let instructor = Instructor(fname: "ali", lname: "mansour", phone: "78787", email: "ali.a.mansour2004@gmail.com")
    InstructorTabView(instructor: instructor)
}
