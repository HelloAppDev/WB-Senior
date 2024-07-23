//
//  PhoneTextFieldView.swift
//  wb_client
//
//  Created by Мария Изюменко on 13.07.2024.
//

import SwiftUI
import Combine

struct PhoneNumberTextField_Previews: PreviewProvider {
    @State static var phoneNumber: String = ""

    static var previews: some View {
        PhoneNumberTextField(phoneNumber: $phoneNumber)
    }
}

struct PhoneNumberTextField: View {
    @Binding var phoneNumber: String
    @State private var isValid: Bool = true
    @State private var showValidationError: Bool = false
    @State private var validationWorkItem: DispatchWorkItem?
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 0) {
                if showValidationError {
                    Text("Некорректный формат номера")
                        .foregroundColor(.red)
                        .font(.montserratRegular(ofSize: 14))
                        .padding(.top, 2)
                }
                HStack {
                    ZStack(alignment: .leading) {
                        if phoneNumber.isEmpty {
                            Text("+7 (___) ___ - __ - __")
                                .foregroundColor(Color.white.opacity(0.6))
                                .font(.montserratRegular(ofSize: 16))
                        }
                        TextField("", text: $phoneNumber)
                            .keyboardType(.numberPad)
                            .tint(Color.white)
                            .font(.montserratRegular(ofSize: 16))
                            .padding(.bottom, showValidationError ? 0 : 3)
                            .foregroundColor(Color.white)
                            .onChange(of: phoneNumber) { oldValue, newValue in
                                if newValue.isEmpty {
                                    phoneNumber = ""
                                } else {
                                    phoneNumber = formatPhoneNumber(phoneNumber: newValue)
                                }
                                validatePhoneNumberWithDelay()
                            }
                    }
                    if !phoneNumber.isEmpty {
                        Button(action: {
                            phoneNumber = ""
                        }) {
                            Image(systemName: "xmark.circle.fill")
                                .tint(.white)
                        }
                        .frame(width: 20, height: 20)
                        .padding(.horizontal, 5)
                        .padding(.top, showValidationError ? -14 : 5)
                    }
                }
            }
            .padding()
            .frame(height: 50)
            .background(Color.gray.opacity(0.4))
            .cornerRadius(12)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(isValid ? Color.clear : Color.red, lineWidth: 1)
            )
        }
        .padding()
        .animation(.easeInOut, value: showValidationError)
    }

    func formatPhoneNumber(phoneNumber: String) -> String {
        let rawPhoneNumber = phoneNumber.filter { "0123456789".contains($0) }
        
        var formattedNumber = "+7"
        
        if rawPhoneNumber.count > 1 {
            formattedNumber += " ("
            formattedNumber += String(rawPhoneNumber.dropFirst().prefix(3))
        }
        if rawPhoneNumber.count > 4 {
            formattedNumber += ") "
            formattedNumber += String(rawPhoneNumber.dropFirst(4).prefix(3))
        }
        if rawPhoneNumber.count > 7 {
            formattedNumber += " - "
            formattedNumber += String(rawPhoneNumber.dropFirst(7).prefix(2))
        }
        if rawPhoneNumber.count > 9 {
            formattedNumber += " - "
            formattedNumber += String(rawPhoneNumber.dropFirst(9).prefix(2))
        }
        
        return formattedNumber
    }

    func validatePhoneNumber() {
        let rawPhoneNumber = phoneNumber.filter { "0123456789".contains($0) }
        isValid = rawPhoneNumber.count == 11
        showValidationError = !isValid
    }
    
    func validatePhoneNumberWithDelay() {
        validationWorkItem?.cancel()
        
        let workItem = DispatchWorkItem {
            self.validatePhoneNumber()
        }
        
        validationWorkItem = workItem
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: workItem)
    }
}
