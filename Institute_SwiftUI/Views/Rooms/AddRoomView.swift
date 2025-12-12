//
//  AddRoomView.swift
//  Institute_SwiftUI
//
//  Created by Ali Mansour on 12/12/2025.
//

import SwiftUI
import SwiftData

struct AddRoomView: View {
    let admin: Admin
    @EnvironmentObject var session: AuthSession
    @Environment(\.modelContext) var context
    @Environment(\.dismiss) var dismiss
    @StateObject private var vm = AddRoomViewModel()
    
    var body: some View {
        VStack{
            Text("Add a Room")
                .font(.largeTitle)
                .bold()
                .padding(.bottom, 30)
            
            TextField("Room Number", value: $vm.number, formatter: vm.numberFormatter)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.numberPad)
            
            TextField("Room Capacity", value: $vm.capacity, formatter: vm.numberFormatter)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.numberPad)
            
            if let error = vm.error{
                Text(error)
                    .foregroundColor(.red)
                    .font(.footnote)
            }
            
            Button{
                vm.AddRoom(context: context)
                if vm.error == nil{
                    dismiss()
                }
            }label: {
                if vm.isLoading{
                    ProgressView()
                }else{
                    Text("Add Room")
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
    AddRoomView(admin: admin)
}
