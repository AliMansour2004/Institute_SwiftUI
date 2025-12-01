//
//  AdminTabView.swift
//  Institute_SwiftUI
//
//  Created by Ali Mansour on 01/12/2025.
//

import SwiftUI

struct AdminTabView: View {
    let admin: Admin
    @EnvironmentObject var session: AuthSession
    
    enum AdminTab : Hashable{
        case roles, universities, courses, rooms, settings //roles have std & ins, courses contains also offerings
    }
    
    @State private var selectedTab: AdminTab = .roles
    
    var body: some View {
        
        TabView(selection: $selectedTab) {
            
            NavigationStack{
                AdminInstructorView(admin: admin)
                    .navigationTitle("Roles")
            }
            .tabItem({
                Text("Roles")
                Image(systemName: "person.2.fill")
            })
            .tag(AdminTab.roles)
            
            NavigationStack{
                AdminUniversityView(admin: admin)
                    .navigationTitle("Universities")
            }
            .tabItem({
                Text("Universities")
                Image(systemName: "book.fill")
            })
            .tag(AdminTab.universities)
            
            NavigationStack{
                AdminCourseView(admin: admin)
                    .navigationTitle("Courses")
            }
            .tabItem({
                Text("Courses")
                Image(systemName: "book.fill")
            })
            .tag(AdminTab.courses)
            
            NavigationStack{
                AdminRoomView(admin: admin)
                    .navigationTitle("Rooms")
            }
            .tabItem({
                Text("Rooms")
                Image(systemName: "house.fill")
            })
            .tag(AdminTab.rooms)
            
            NavigationStack{
                AdminSettingsView(admin: admin)
                    .navigationTitle("Settings")
            }
            .tabItem ({
                Text("Settings")
                Image(systemName: "gearshape.fill")
            })
                        
        }
        
        
    }
}

#Preview {
    let admin = Admin()
    AdminTabView(admin: admin)
}
