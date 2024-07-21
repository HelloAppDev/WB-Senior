//
//  BackgroundView.swift
//  wb_client
//
//  Created by Мария Изюменко on 14.07.2024.
//

import SwiftUI

struct BackgroundView: View {
    var body: some View {
        Image("purpleBackground")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .blur(radius: 150, opaque: true)
            .ignoresSafeArea(.all)
    }
}

#Preview {
    BackgroundView()
}
