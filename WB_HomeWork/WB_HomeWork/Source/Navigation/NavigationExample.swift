//
//  NavigationExample.swift
//  WB_HomeWork
//
//  Created by Мария Изюменко on 23.07.2024.
//

import SwiftUI

struct NavigationExample: View {
    @StateObject private var navigationActions = NavigationActions()
    
    var body: some View {
        NavigationContainer(navigationAction: navigationActions) {
            VStack {
                Text("Главный экран")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding()
                
                Button("Перейти на экран 1 (Пуш)") {
                    let view = AnyView(Screen1().environmentObject(navigationActions))
                    navigationActions.push(view: view)
                }
                .foregroundColor(.white)
                .padding()
                
                Button("Перейти на экран 2 (Презент)") {
                    let view = AnyView(Screen2().environmentObject(navigationActions))
                    navigationActions.present(view: view)
                }
                .foregroundColor(.white)
                .padding()
                
                Button("Перейти на экран 3 (Кастом)") {
                    let view = AnyView(Screen3().environmentObject(navigationActions))
                    navigationActions.customPresentation(view: view)
                }
                .foregroundColor(.white)
                .padding()
                
                if navigationActions.navStack.count > 0 {
                    Button(action: {
                        withAnimation { navigationActions.popLast() }
                    }) {
                        Text("Pop")
                            .foregroundColor(.white)
                    }
                }
                
                Button(action: {
                    withAnimation { navigationActions.popToRoot() }
                }) {
                    Text("Pop to Root Screen")
                        .foregroundColor(.white)
                }
            }
        }
        .animation(.easeInOut) { _ in }
    }
}

struct NavigationContainer<Content: View>: View {
    @ObservedObject var navigationAction: NavigationActions
    let content: () -> Content
    
    var body: some View {
        ZStack {
            if navigationAction.navStack.isEmpty {
                content()
                    .transition(.opacity)
            } else {
                ForEach(0..<navigationAction.navStack.count, id: \.self) { index in
                    if index == navigationAction.navStack.count - 1 {
                        navigationAction.navStack[index]
                            .transition(self.transition(for: navigationAction.navigationType))
                    }
                }
            }
        }
    }
    
    private func transition(for type: NavigationTypes) -> AnyTransition {
        switch type {
        case .present:
            return .move(edge: .bottom)
        case .push:
            return .move(edge: .trailing)
        case .custom:
            return .opacity
        }
    }
}
