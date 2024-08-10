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
            BackgroundView()
            VStack {
                CalculatorView()
//                Button(action: {
//                    // go back action
//                }, label: {
//                    Image(systemName: Constants.chevronImage)
//                        .padding(.leading, 10)
//                    Text(Constants.goBackTitle)
//                        .font(.montserratRegular(ofSize: 16))
//                    
//                })
//                .foregroundColor(.white)
            }
        }
    }
}

#Preview {
    ContentView()
}
