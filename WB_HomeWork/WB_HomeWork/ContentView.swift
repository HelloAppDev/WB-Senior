//
//  ContentView.swift
//  WB_HomeWork
//
//  Created by Мария Изюменко on 22.07.2024.
//

import SwiftUI

private enum Constants {
    static let chevronImage = "chevron.left"
    static let goBackTitle = "Вернуться назад"
}

struct ContentView: View {
    var body: some View {
        ZStack {
            VStack {
                ChatView()
            }
        }
    }
}

#Preview {
    ContentView()
}
