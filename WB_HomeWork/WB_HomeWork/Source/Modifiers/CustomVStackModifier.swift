//
//  CustomVStackModifier.swift
//  WB_HomeWork
//
//  Created by Мария Изюменко on 23.07.2024.
//

import SwiftUI

struct CustomVStackModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(Color.black.opacity(0.3))
            .cornerRadius(28)
            .frame(maxWidth: 400)
            .padding()
    }
}
