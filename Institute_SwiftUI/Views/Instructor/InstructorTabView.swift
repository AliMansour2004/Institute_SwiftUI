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
            
            InstructorHomeView(instructor: instructor)
                .tabItem({
                    Image(systemName: "house")
                    Text("Home")
                })
            
        }
    }
}

#Preview {
    let instructor = Instructor(fname: "ali", lname: "mansour", phone: "78787", email: "ali.a.mansour2004@gmail.com")
    InstructorTabView(instructor: instructor)
}
