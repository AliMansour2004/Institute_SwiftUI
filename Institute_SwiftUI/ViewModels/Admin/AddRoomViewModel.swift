//
//  AddRoomViewModel.swift
//  Institute_SwiftUI
//
//  Created by Ali Mansour on 11/12/2025.
//

import SwiftUI
import SwiftData
import Combine

@MainActor
final class AddRoomViewModel: ObservableObject {
    @Published var number: Int?
    @Published var capacity: Int?
    @Published var isLoading: Bool = false
    @Published var error: String?
    
    func AddRoom(context: ModelContext) {
        error = nil

        guard let number = number else {
            error = "Please enter a room number."
            return
        }

        guard let capacity = capacity else {
            error = "Please enter a capacity."
            return
        }

        guard number >= 100 && number <= 300 else {
            error = "Room number must be between 100 and 300."
            return
        }

        guard capacity > 0 && capacity <= 45 else {
            error = "Capacity must be between 0 and 45."
            return
        }

        isLoading = true
        defer { isLoading = false }

        do {
            guard try !RoomExists(number: number, context: context) else {
                error = "Room already exists"
                return
            }

            let room = Room(number: number, capacity: capacity)
            context.insert(room)
        } catch let err {
            error = "Unexpected error while creating a room."
            print("AddRoomViewModel error:", err)
        }
    }
    
    private func RoomExists(number: Int, context: ModelContext) throws -> Bool {
        let descriptor = FetchDescriptor<Room>(predicate: #Predicate { $0.number == number })
        let result = try context.fetch(descriptor)
        return result.isEmpty == false
    }
    
    var numberFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .none
        formatter.minimum = 0
        return formatter
    }
    
}
