//
//  String+Validation.swift
//  Institute_SwiftUI
//
//  Created by Ali Mansour on 29/11/2025.
//

import Foundation

extension String {
    
    var isValidEmail: Bool {
        let pattern = #"^\S+@\S+\.\S+$"#
        return range(of: pattern, options: .regularExpression) != nil
    }
    
//    ^\S+ means one or more non-whitespace characters at the start.
//
//    @\S+ then the @ followed by one or more non-whitespace characters.
//
//    \.\S+$ then a literal dot . followed by one or more non-whitespace characters until end of string.
//
//    So effectively it ensures there is something before @, something between @ and ., and something after the . — but it is very permissive (doesn’t check domain rules, length, allowed characters beyond “not whitespace”).
//
//    Using range(of:pattern, options:.regularExpression) != nil is a common way in Swift to test if a String matches a regex.
    
    
    
    
    // Rules: ≥8 characters, 1 uppercase, 1 number, 1 symbol
    var isStrongPassword: Bool {
        let lengthRule = self.count >= 8
        let uppercaseRule = range(of: "[A-Z]", options: .regularExpression) != nil
        let numberRule = range(of: "[0-9]", options: .regularExpression) != nil
        let specialRule = range(of: "[!@#$%^&*(),.?\":{}|<>]", options: .regularExpression) != nil
        
        return lengthRule && uppercaseRule && numberRule && specialRule
    }
}

