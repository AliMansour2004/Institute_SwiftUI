//
//  KeychainHelper.swift
//  Institute_SwiftUI
//
//  Created by Ali Mansour on 24/11/2025.
//

import Foundation
import Security

final class KeychainHelper {

    static let shared = KeychainHelper()
    private init() {} //this prevent any call outside this class, so we can only use the static shared constant(instance) above

    func savePassword(_ password: String, email: String) {
        let data = Data(password.utf8) //encrypt the password
        // If exists → update to prevent duplication if a password already saved for this email
        if readPassword(email: email) != nil {
            updatePassword(password, email: email)
            return
        }
        
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: email,
            kSecValueData as String: data
        ]
        
        SecItemAdd(query as CFDictionary, nil)
    }
    
    func readPassword(email: String) -> String? {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: email,
            kSecReturnData as String: true,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]
        
        var item: AnyObject?
        let status = SecItemCopyMatching(query as CFDictionary, &item)
        
        guard status == errSecSuccess, let data = item as? Data else {
            return nil
        }
        
        return String(data: data, encoding: .utf8)
    }
    
    
    func updatePassword(_ password: String, email: String) {
        let data = Data(password.utf8)
        
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: email
        ]
        
        let attributes: [String: Any] = [
            kSecValueData as String: data
        ]
        
        SecItemUpdate(query as CFDictionary, attributes as CFDictionary)
    }
    

    func deletePassword(email: String) {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: email
        ]
        
        SecItemDelete(query as CFDictionary)
    }
}

