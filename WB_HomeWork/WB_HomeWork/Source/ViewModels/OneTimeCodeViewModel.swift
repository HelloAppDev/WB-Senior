//
//  OneTimeCodeViewModel.swift
//  wb_client
//
//  Created by Мария Изюменко on 30.06.2024.
//

import SwiftUI

private enum Constants {
    static let correctCode = ""
    static let incorrectCode = "Неверный пароль"
}

class AuthViewModel: ObservableObject {
    @Published var code: String = .init()
    @Published var statusMessage: String = .init()
    @Published var isValid: Bool = .init()
    @Published var shouldShowBorders: Bool = .init()
    
    let correctCode = "1234"
    let maxDigits = 4
    
    func validateCode() {
        if code.count == maxDigits {
            if code == correctCode {
                statusMessage = Constants.correctCode
                isValid = true
            } else {
                statusMessage = Constants.incorrectCode
                isValid = false
            }
            shouldShowBorders = true
        } else {
            statusMessage = Constants.incorrectCode
            isValid = false
            shouldShowBorders = false
        }
    }
}

