//
//  AddCourseView.swift
//  Institute_SwiftUI
//
//  Created by Ali Mansour on 11/12/2025.
//

import SwiftUI
import SwiftData

struct AddCourseView: View {
    let admin: Admin
    @Environment(\.modelContext) var context
    @Environment(\.dismiss) private var dismiss
    @StateObject private var vm = AddCourseViewModel()
    
    var body: some View {
        VStack {
            Text("Add a Course")
                .font(.largeTitle)
                .bold()
                .padding(.bottom, 30)
            
            TextField("Course Title", text: $vm.title)
                .textFieldStyle(.roundedBorder)
            
            if let error = vm.error{
                Text(error)
                    .foregroundColor(.red)
                    .font(.footnote)
            }
            
            Button{
                vm.AddCourse(context: context)
                if vm.error == nil{
                    dismiss()
                }
            }label: {
                if vm.isLoading{
                    ProgressView()
                }else{
                    Text("Add The Course")
                }
            }
            .buttonStyle(.borderedProminent)
            .padding()
            
            Spacer()
        }
        .padding()
        
    }
}

#Preview {
    let admin = Admin()
    AddCourseView(admin: admin)
}
