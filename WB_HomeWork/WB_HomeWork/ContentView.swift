//
//  ContentView.swift
//  WB_HomeWork
//
//  Created by Мария Изюменко on 22.07.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            BackgroundView()
            VStack {
                AuthCodeView()
                    .padding(.bottom, 32)
            }
        }
    }
}

#Preview {
    ContentView()
}
