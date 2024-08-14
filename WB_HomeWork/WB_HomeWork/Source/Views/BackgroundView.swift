//
//  BackgroundView.swift
//  wb_client
//
//  Created by Мария Изюменко on 14.07.2024.
//

import SwiftUI

struct BackgroundView<Content>: View where Content: View {
    private let image: UIImage?
    private let content: Content
    private let color: Color = .black
    
    init(image: UIImage?, @ViewBuilder content: @escaping () -> Content) {
        self.image = image
        self.content = content()
    }
    
    var body: some View {
        ZStack {
            content
        }
        .background(
            ZStack {
                color
                Image(uiImage: image ?? UIImage())
                    .resizable()
                    .scaledToFill()
                    .blur(radius: 128)
                    .scaleEffect(1.6)
                    .clipped()
            }
                .edgesIgnoringSafeArea(.all)
                .frame(width: UIScreen.main.bounds.width,
                       height: UIScreen.main.bounds.height)
        )
    }
}

#Preview {
    BackgroundView(image: UIImage(named: "purpleBackground")) {
        EmptyView()
    }
}
