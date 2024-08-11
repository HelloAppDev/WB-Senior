//
//  CircleImage.swift
//  WB_HomeWork
//
//  Created by Мария Изюменко on 10.08.2024.
//

import SwiftUI

struct CircleImage: View {
    private let image: UIImage!
    private let sideSize: CGFloat
        
    init(image: UIImage, sideSize: CGFloat) {
        self.image = image
        self.sideSize = sideSize
    }

    var body: some View {
        Image(uiImage: image)
        .resizable()
        .scaledToFill()
        .clipShape(Circle())
        .frame(width: sideSize, height: sideSize)
    }
}
