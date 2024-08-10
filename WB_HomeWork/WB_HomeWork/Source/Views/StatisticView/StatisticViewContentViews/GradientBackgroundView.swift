//
//  GradientBackgroundView.swift
//  WB_HomeWork
//
//  Created by Мария Изюменко on 08.08.2024.
//

import SwiftUI

enum CustomGradient {
    case lightPink
    case darkPurple
    
    var colors: [Color] {
        switch self {
        case .lightPink:
            return [Color("pinkColor"),
                    Color("darkPinkColor")]
        case .darkPurple:
            return [Color("ligthPurpleColor"),
                    Color("darkPurpleColor")]
        }
    }
}

struct GradientBackgroundView<Content>: View where Content: View {
    let gradient: CustomGradient
    private let startEndPoints: (startPoint: UnitPoint, endPoint: UnitPoint)
    private let content: Content
    
    init(gradient: CustomGradient,
         points: (UnitPoint, UnitPoint),
         @ViewBuilder content: @escaping () -> Content) {
        self.gradient = gradient
        self.startEndPoints = points
        self.content = content()
    }
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(LinearGradient(
                    gradient: Gradient(colors: gradient.colors),
                    startPoint: startEndPoints.0,
                    endPoint: startEndPoints.1
                ))
            content
        }
    }
}

extension GradientBackgroundView: Stubbable {
    static func stub() -> any View {
        return GradientBackgroundView<EmptyView>(gradient: .darkPurple,
                                                 points: (.leading, .trailing)) {
            EmptyView()
        }
    }
}
