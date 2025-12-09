//
//  GuestTabView.swift
//  Institute_SwiftUI
//
//  Created by Ali Mansour on 09/12/2025.
//

import SwiftUI

struct GuestTabView: View {
    @Environment(\.modelContext) private var context
    @EnvironmentObject var session: AuthSession
    
    enum GuestTab: Hashable{
        case welcome, courses
    }  	
    
    @State private var selectedTab: GuestTab = .welcome
    
    var body: some View {
        
        TabView(selection: $selectedTab){
            NavigationStack{
                Welcome()
            }
            .tabItem({
                Text("Welcome")
                Image(systemName: "house")
            })
            .tag(GuestTab.welcome)
            
            NavigationStack{
                CourseListView()
                    .navigationTitle("Courses")
            }
            .tabItem({
                Text("Courses")
                Image(systemName: "book")
            })
            .tag(GuestTab.courses)
        }
    }
}

#Preview {
    GuestTabView()
}
