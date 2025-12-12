//
//  AdminRolesView.swift
//  Institute_SwiftUI
//
//  Created by Ali Mansour on 09/12/2025.
//

import SwiftUI
import SwiftData

struct AdminRolesView: View {
    let admin: Admin
    @EnvironmentObject var session: AuthSession
    
    @Query(sort: \Instructor.fname) private var instructors: [Instructor]
    @Query(sort: \Student.fname) private var students: [Student]
    
    @StateObject private var vm = AdminRolesViewModel()
    @State private var showingInstructorSignup = false
    @State private var showingStudentSignup = false
    
    var body: some View {
        Group {
            switch vm.currentRole {
            case .instructor:
                if instructors.isEmpty {
                    ContentUnavailableView(AppStrings.AdminRoles.InsUnavailableViewText,
                                           systemImage: AppStrings.AdminRolesImage.InsUnavailableViewImage,
                                           description: Text(AppStrings.AdminRoles.InsUnavailableViewDescription))
                } else {
                    List(instructors) { instructor in
                        HStack {
                            Image(systemName: AppStrings.AdminRolesImage.InsImage)
                            Text("\(instructor.fname) \(instructor.lname)")
                        }
                    }
                }
            case .student:
                if students.isEmpty {
                    ContentUnavailableView(AppStrings.AdminRoles.StdUnavailableViewText,
                                           systemImage: AppStrings.AdminRolesImage.StdUnavailableViewImage,
                                           description: Text(AppStrings.AdminRoles.StdUnavailableViewDescription))
                } else {
                    List(students) { student in
                        HStack {
                            Image(systemName: AppStrings.AdminRolesImage.StdImage)
                            Text("\(student.fname) \(student.lname)")
                        }
                    }
                }
            } //switch
        } //group
        .navigationTitle(vm.navigationTitle)
        .toolbar{
            ToolbarItem(placement: .topBarTrailing){
                if vm.currentRole == .instructor {
                    Button {
                        showingInstructorSignup = true
                    } label: {
                        Label(AppStrings.AdminRoles.InsAddButton, systemImage: AppStrings.AdminRolesImage.AddButtonImage)
                    }
                }
                else if vm.currentRole == .student {
                    Button{
                        showingStudentSignup = true
                    } label: {
                        Label(AppStrings.AdminRoles.StdAddButton, systemImage: AppStrings.AdminRolesImage.AddButtonImage)
                    }
                }
            }
            
            ToolbarItem(placement: .topBarLeading){
                Menu {
                    Button(AppStrings.AdminRoles.InsButton) {
                        vm.showInstructors()
                    }
                    Button(AppStrings.AdminRoles.StdButton) {
                        vm.showStudents()
                    }
                } label: {
                    Label(AppStrings.AdminRoles.MenuLabel, systemImage:AppStrings.AdminRolesImage.MenuLabelImage)
                }
            }
        } //toolbar
        .sheet(isPresented: $showingInstructorSignup) {
            InstructorSignupView()
        }
        .sheet(isPresented: $showingStudentSignup) {
            StudentSignupView()
        }
    }
}

#Preview {
    let admin = Admin()
    AdminTabView(admin: admin)
}
