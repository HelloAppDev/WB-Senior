//
//  NavigationExampleScreens.swift
//  WB_HomeWork
//
//  Created by Мария Изюменко on 23.07.2024.
//

import SwiftUI

struct Screen1: View {
    @EnvironmentObject var navigationActions: NavigationActions
    
    var body: some View {
        VStack {
            Text("Экран 1")
                .font(.largeTitle)
                .padding()
                .foregroundColor(.white)
            Button("Назад") {
                navigationActions.popLast()
            }
            .foregroundColor(.white)
            .padding()
        }
    }
}

struct Screen2: View {
    @EnvironmentObject var navigationActions: NavigationActions
    
    var body: some View {
        VStack {
            Text("Экран 2")
                .font(.largeTitle)
                .padding()
                .foregroundColor(.white)
            Button("Назад") {
                navigationActions.popLast()
            }
            .foregroundColor(.white)
            .padding()
        }
    }
}

struct Screen3: View {
    @EnvironmentObject var navigationActions: NavigationActions
    
    var body: some View {
        VStack {
            Text("Экран 3")
                .font(.largeTitle)
                .padding()
                .foregroundColor(.white)
            Button("Назад") {
                navigationActions.popLast()
            }
            .foregroundColor(.white)
            .padding()
        }
    }
}

