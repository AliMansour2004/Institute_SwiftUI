//
//  AdminPlaceView.swift
//  Institute_SwiftUI
//
//  Created by Ali Mansour on 11/12/2025.
//

import SwiftUI
import SwiftData

struct AdminPlaceView: View {
    let admin: Admin
    @EnvironmentObject var session: AuthSession
    
    @Query(sort: \University.name) private var universities: [University]
    @Query(sort: \Room.number) private var rooms: [Room]
    
    @StateObject private var vm = AdminPlaceViewModel()
    @State private var showingUniversityAddition: Bool = false
    @State private var showingRoomAddition: Bool = false
    
    var body: some View {
        Group {
            switch vm.currentPlace {
            case .university:
                if universities.isEmpty {
                    ContentUnavailableView("there is no universities", systemImage: "book", description: Text("Press the plus button to add a university"))
                } else {
                    List(universities) { university in
                        Text(university.name)
                    }
                }
                
            case .room:
                if rooms.isEmpty {
                    ContentUnavailableView {
                        Label("there are no rooms", systemImage: "book.fill")
                    } description: {
                        Text("Press the plus button to add a room")
                    }
                } else {
                    List(rooms) { room in
                        HStack {
                            Text(String(room.number))
                            Spacer()
                            Text(String(room.capacity))
                        }
                    }
                }
                
            }
        }
        .navigationTitle(vm.navigationTitle)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Menu {
                    Button("Universities") {
                        vm.currentPlace = .university
                    }
                    Button("Rooms") {
                        vm.currentPlace = .room
                    }
                } label: {
                    Label("Places", systemImage: "list.bullet")
                }
            }
            ToolbarItem(placement: .topBarTrailing) {
                switch vm.currentPlace {
                case .university:
                    Button {
                        showingUniversityAddition = true
                    } label: {
                        Label("Add University", systemImage: "plus")
                    }
                case .room:
                    Button {
                        showingRoomAddition = true
                    } label: {
                        Label("Add Room", systemImage: "plus")
                    }
                }
            }
        }
        .sheet(isPresented: $showingUniversityAddition) {
            AddUniversityView(admin: admin)
        }
        .sheet(isPresented: $showingRoomAddition) {
            AddRoomView(admin: admin)
        }
    }
}

#Preview {
    let admin = Admin()
    AdminTabView(admin: admin)
}

