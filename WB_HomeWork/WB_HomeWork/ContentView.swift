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
                Button(action: {
                    // go back action
                }, label: {
                    Image(systemName: "chevron.left")
                        .padding(.leading, 10)
                    Text("Вернуться назад")
                        .font(.montserratRegular(ofSize: 16))
                    
                })
                .foregroundColor(.white)
            }
        }
    }
}

#Preview {
    ContentView()
}
