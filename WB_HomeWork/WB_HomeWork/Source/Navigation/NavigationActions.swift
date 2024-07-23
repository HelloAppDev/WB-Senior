//
//  NavigationActions.swift
//  WB_HomeWork
//
//  Created by Мария Изюменко on 23.07.2024.
//

import SwiftUI

final class NavigationActions: ObservableObject {
    @Published var navStack: [AnyView] = []
    @Published var navigationType: NavigationTypes = .present
    
    func present(view: AnyView) {
        navigationType = .present
        navStack.append(AnyView(view))
    }
    
    func push(view: AnyView) {
        navigationType = .push
        navStack.append(AnyView(view))
    }
    
    func customPresentation(view: AnyView) {
        navigationType = .custom
        navStack.append(AnyView(view))
    }
    
    func popLast() {
        if !navStack.isEmpty {
            navStack.removeLast()
        }
    }
    
    func popToRoot() {
        navStack.removeAll()
    }
}
