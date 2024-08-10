//
//  CalculatorButtonView.swift
//  WB_HomeWork
//
//  Created by Мария Изюменко on 11.08.2024.
//

import SwiftUI

struct CalculatorButtonView: View {
    let label: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(label)
                .font(.montserratSemiBold(ofSize: 24))
                .foregroundStyle(Color.white)
                .frame(width: 60, height: 60)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(30)
        }
    }
}
