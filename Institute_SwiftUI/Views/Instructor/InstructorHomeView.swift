////
////  InstructorHomeView.swift
////  Institute_SwiftUI
////
////  Created by Ali Mansour on 24/11/2025.
////
//
//import SwiftUI
//
//struct InstructorHomeView: View {
//    let instructor: Instructor
//    @State private var selectedTab: InstructorTab = .home
//    
//    var body: some View {
//        TabView(selection: $selectedTab) {
//            
//            InstructorHomeView(instructor: instructor)
//                .tabItem {
//                    Label(AppStrings.TabTitle.instructorHome,
//                          systemImage: AppStrings.TabImageName.instructorHome)
//                }
//                .tag(InstructorTab.home)
//            
//            InstructorCoursesView()
//                .tabItem {
//                    Label(AppStrings.TabTitle.instructorCourses,
//                          systemImage: AppStrings.TabImageName.instructorCourses)
//                }
//                .tag(InstructorTab.courses)
//            
//            InstructorProfileView(instructor: instructor)
//                .tabItem {
//                    Label(AppStrings.TabTitle.instructorProfile,
//                          systemImage: AppStrings.TabImageName.instructorProfile)
//                }
//                .tag(InstructorTab.profile)
//            
//            SettingsView()
//                .tabItem {
//                    Label(AppStrings.TabTitle.settings,
//                          systemImage: AppStrings.TabImageName.settings)
//                }
//                .tag(InstructorTab.settings)
//        }
//    }
//}
//
//
