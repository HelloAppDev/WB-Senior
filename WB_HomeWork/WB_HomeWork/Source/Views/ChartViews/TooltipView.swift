//
//  TooltipView.swift
//  WB_HomeWork
//
//  Created by Мария Изюменко on 12.08.2024.
//

import SwiftUI

struct TooltipView: View {
    let value: Double
    
    var body: some View {
        VStack {
            Text(String(format: "%.2f", value))
                .font(.montserratMedium(ofSize: 14))
                .foregroundColor(.white)
                .padding(5)
                .background(Color.white.opacity(0.1))
                .cornerRadius(8)
            ZStack {
                Circle()
                    .fill(Color.clear)
                    .frame(width: 32, height: 32)
                    .overlay(Circle().stroke(.button, lineWidth: 1))
                Circle()
                    .fill(Color.white)
                    .frame(width: 20, height: 20)
                    .overlay(Circle().stroke(.button, lineWidth: 3))
            }
        }
    }
}
