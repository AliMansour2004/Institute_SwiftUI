//
//  Welcome.swift
//  Institute_SwiftUI
//
//  Created by Ali Mansour on 29/11/2025.
//

import SwiftUI

struct Welcome: View {
    var body: some View {
        NavigationStack{
            VStack{
                Text("Welcome")
                    .font(.largeTitle)
                
                Text("Institute SwiftUI")
                    .font(.largeTitle)
                
                
                Image("Welcome")
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(30)
                
                NavigationLink(destination: LoginView()) {
                    Text("Login")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .foregroundStyle(.white)
                        .cornerRadius(15)
                }
                .padding(.top, 20)
                
                NavigationLink(destination: StudentSignupView()) {
                    Text("Get Started as a Student")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .foregroundStyle(.white)
                        .cornerRadius(15)
                }
                .padding(.top, 20)
                
                NavigationLink(destination: InstructorSignupView()) {
                    Text("Get Started as an Instructor")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .foregroundStyle(.white)
                        .cornerRadius(15)
                }
                Spacer()
            }
            .padding()
        } //navigationStack
    } //body
}


#Preview {
    Welcome()
}
