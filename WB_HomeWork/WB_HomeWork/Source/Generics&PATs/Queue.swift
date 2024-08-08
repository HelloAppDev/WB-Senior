//
//  Queue.swift
//  WB_HomeWork
//
//  Created by Мария Изюменко on 24.07.2024.
//

import Foundation

class Queue<Element> {
    private var elements: [Element] = []

    func enqueue(_ element: Element) {
        elements.append(element)
    }

    func dequeue() -> Element? {
        guard !elements.isEmpty else { return nil }
        return elements.removeFirst()
    }
}
