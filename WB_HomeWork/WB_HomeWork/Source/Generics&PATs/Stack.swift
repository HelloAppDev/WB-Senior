//
//  Stack.swift
//  WB_HomeWork
//
//  Created by Мария Изюменко on 24.07.2024.
//

import Foundation

struct Stack<Element> {
    private var elements: [Element] = []
    
    mutating func push(_ element: Element) {
        elements.append(element)
    }
    
    mutating func pop() -> Element? {
        return elements.popLast()
    }
}
