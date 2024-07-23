//
//  AccentButton.swift
//  WB_HomeWork
//
//  Created by Мария Изюменко on 23.07.2024.
//

import SwiftUI

struct AccentButton: View {
    let text: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(text)
                .foregroundColor(.white)
                .font(.montserratMedium(ofSize: 16))
        }
        .padding(.horizontal, 110)
        .frame(height: 48)
        .background(Color.buttonColor)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .padding([.bottom], 30)
    }
}
