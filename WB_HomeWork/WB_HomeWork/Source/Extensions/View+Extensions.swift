//
//  View+Extensions.swift
//  WB_HomeWork
//
//  Created by Мария Изюменко on 23.07.2024.
//

import SwiftUI

extension View {
    func hideKeyboard() {
        let resign = #selector(UIResponder.resignFirstResponder)
        UIApplication.shared.sendAction(resign,
                                        to: nil,
                                        from: nil,
                                        for: nil)
    }
    
    func isHide(_ hide: Bool) -> some View {
        self.opacity(hide ? 0 : 1)
    }
    
    func customVStackStyle() -> some View {
        self.modifier(CustomVStackModifier())
    }
    
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}
