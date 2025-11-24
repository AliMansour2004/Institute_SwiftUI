//
//  Room.swift
//  Institute_SwiftUI
//
//  Created by Ali Mansour on 23/11/2025.
//

import SwiftData

@Model
final class Room{
    var number: Int
    var capacity: Int?
    
    @Relationship(deleteRule: .cascade, inverse: \Offering.room)
    var offerings: [Offering] = []
    
    init(number: Int, capacity: Int? = nil) {
        self.number = number
        self.capacity = capacity
    }
    
}
