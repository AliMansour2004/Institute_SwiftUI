////
////  StudentHomeView.swift
////  Institute_SwiftUI
////
////  Created by Ali Mansour on 24/11/2025.
////
//
//import SwiftUI
//
//struct StudentHomeView: View {
//    let student: Student
//    @State private var selectedTab: StudentTab = .home
//    
//    var body: some View {
//        TabView(selection: $selectedTab) {
//            
//            StudentHomeView(student: student)
//                .tabItem {
//                    Label(AppStrings.TabTitle.studentHome,
//                          systemImage: AppStrings.TabImageName.studentHome)
//                }
//                .tag(StudentTab.home)
//            
//            StudentOfferingsView(student: student)
//                .tabItem {
//                    Label(AppStrings.TabTitle.studentOfferings,
//                          systemImage: AppStrings.TabImageName.studentOfferings)
//                }
//                .tag(StudentTab.offerings)
//            
//            StudentProfileView(student: student)
//                .tabItem {
//                    Label(AppStrings.TabTitle.studentProfile,
//                          systemImage: AppStrings.TabImageName.studentProfile)
//                }
//                .tag(StudentTab.profile)
//            
//            SettingsView()
//                .tabItem {
//                    Label(AppStrings.TabTitle.settings,
//                          systemImage: AppStrings.TabImageName.settings)
//                }
//                .tag(StudentTab.settings)
//        }
//    }
//}
//
