//
//  AdminPlaceViewModel.swift
//  Institute_SwiftUI
//
//  Created by Ali Mansour on 11/12/2025.
//

import SwiftUI
import Combine

@MainActor
final class AdminPlaceViewModel: ObservableObject {
    
    enum placeType{
        case university, room
    }
    
    @Published var currentPlace: placeType = .university
    
    var navigationTitle: String {
        switch currentPlace {
        case .university:
            return "University"
        case .room:
            return "Rooms"
        }
    }
    
    func showUniversity() {
        currentPlace = .university
    }
    
    func showRoom() {
        currentPlace = .room
    }
    
}
