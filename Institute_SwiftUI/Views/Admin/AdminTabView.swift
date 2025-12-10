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
                AdminRolesView(admin: admin)
                    .navigationTitle(AppStrings.AdminTab.Roles)
            }
            .tabItem({
                Text(AppStrings.AdminTab.Roles)
                Image(systemName: AppStrings.AdminTabImage.roles)
            })
            .tag(AdminTab.roles)
            
            NavigationStack{
                AdminUniversityView(admin: admin)
                    .navigationTitle(AppStrings.AdminTab.universities)
            }
            .tabItem({
                Text(AppStrings.AdminTab.universities)
                Image(systemName: AppStrings.AdminTabImage.universities)
            })
            .tag(AdminTab.universities)
            
            NavigationStack{
                AdminCourseView(admin: admin)
                    .navigationTitle(AppStrings.AdminTab.courses)
            }
            .tabItem({
                Text(AppStrings.AdminTab.courses)
                Image(systemName: AppStrings.AdminTabImage.courses)
            })
            .tag(AdminTab.courses)
            
            NavigationStack{
                AdminRoomView(admin: admin)
                    .navigationTitle(AppStrings.AdminTab.rooms)
            }
            .tabItem({
                Text(AppStrings.AdminTab.rooms)
                Image(systemName: AppStrings.AdminTabImage.rooms)
            })
            .tag(AdminTab.rooms)
            
            NavigationStack{
                AdminSettingsView(admin: admin)
                    .navigationTitle(AppStrings.AdminTab.settings)
            }
            .tabItem ({
                Text(AppStrings.AdminTab.settings)
                Image(systemName: AppStrings.AdminTabImage.settings)
            })
                        
        }
        
        
    }
}

#Preview {
    let admin = Admin()
    AdminTabView(admin: admin)
}
