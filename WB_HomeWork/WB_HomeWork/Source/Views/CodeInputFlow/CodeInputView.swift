//
//  CodeInputView.swift
//  wb_client
//
//  Created by Мария Изюменко on 30.06.2024.
//

import SwiftUI

struct CodeInputView: View {
    @Binding var code: String
    var isValid: Bool
    var shouldShowBorders: Bool
    
    var body: some View {
        HStack {
            ForEach(0..<4) { index in
                CodeDigitView(digit: code.count > index ? String(code[code.index(code.startIndex,
                                                                                 offsetBy: index)]) : "",
                              isValid: isValid,
                              shouldShowBorders: shouldShowBorders)
                .padding(.horizontal, 5)
            }
        }
        .foregroundColor(.white)
        .padding()
        .cornerRadius(8)
    }
}

struct CodeDigitView: View {
    let digit: String
    var isValid: Bool
    var shouldShowBorders: Bool
    
    var body: some View {
        Text(digit)
            .frame(width: 64, height: 80)
            .background(Color.white.opacity(0.1))
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(shouldShowBorders ? (isValid ? Color.green : Color.red) : Color.clear, lineWidth: 1)
            )
            .font(.montserratMedium(ofSize: 36))
            .cornerRadius(12)
    }
}
