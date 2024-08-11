//
//  IconTitledButton.swift
//  WB_HomeWork
//
//  Created by Мария Изюменко on 08.08.2024.
//

import SwiftUI

typealias SimpleClosure = () -> Void

struct IconTitledButton: View {
    
    private let text: String
    private let image: UIImage
    private let action: SimpleClosure
    
    init(text: String,
         image: UIImage,
         action: @escaping SimpleClosure) {
        self.text = text
        self.image = image
        self.action = action
    }

    var body: some View {
        Button(action: action) {
            HStack(spacing: 6) {
                Image(uiImage: image)
                    .frame(width: 20, height: 20)
                Text(text)
                    .font(.montserratMedium(ofSize: 14))
                    .lineLimit(1)
                    .fixedSize(horizontal: true, vertical: false)
            }
            .foregroundColor(.white)
        }
    }
}

extension IconTitledButton: Stubbable {
    static func stub() -> any View {
        return IconTitledButton(text: "Отображение виджетов",
                                image: UIImage(named: "slidersIcon") ?? UIImage()) {}
            .padding()
            .background(Color.gray)
    }
}
