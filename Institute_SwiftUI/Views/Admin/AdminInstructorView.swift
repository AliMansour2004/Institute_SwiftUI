//
//  AdminInstructorView.swift
//  Institute_SwiftUI
//
//  Created by Ali Mansour on 01/12/2025.
//

import SwiftUI

struct AdminInstructorView: View {
    let admin: Admin
    @EnvironmentObject var session: AuthSession
    
    var body: some View {
        Text("Hello, \(admin.fname) \(admin.lname)")
    }
}
