//
//  AddUniversity.swift
//  Institute_SwiftUI
//
//  Created by Ali Mansour on 10/12/2025.
//

import SwiftUI
import SwiftData

struct AddUniversityView: View {
    let admin: Admin
    @EnvironmentObject var session: AuthSession
    @Environment(\.modelContext) var context: ModelContext
    @Environment(\.dismiss) var dismiss
    @StateObject private var vm = AddUniversityViewModel()
    
    var body: some View {
        VStack{
            Text("Add a University")
                .font(.largeTitle)
                .bold()
                .padding(.bottom, 30)
            
            TextField("University name", text: $vm.name)
                .textFieldStyle(.roundedBorder)
            
            if let error = vm.error{
                Text(error)
                    .foregroundColor(.red)
                    .font(.footnote)
            }

            Button{
                vm.AddUniversity(context: context)
                if vm.error == nil{
                    dismiss()
                }
            }label: {
                if vm.isLoading{
                    ProgressView()
                }else{
                    Text("Add University")
                }
            }
            .buttonStyle(.borderedProminent)
            .padding()
            
            Spacer()
        } //vstack
        .padding()
    }
}

#Preview {
    let admin = Admin()
    AddUniversityView(admin: admin)
}
