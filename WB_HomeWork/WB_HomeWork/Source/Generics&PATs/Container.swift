//
//  Container.swift
//  WB_HomeWork
//
//  Created by Мария Изюменко on 24.07.2024.
//

import Foundation

protocol Container {
    associatedtype Item
    mutating func add(_ item: Item)
    mutating func remove() -> Item?
}

extension Stack: Container {
    mutating func add(_ item: Element) {
        push(item)
    }
    
    mutating func remove() -> Element? {
        return pop()
    }
}

extension Queue: Container {
    func add(_ item: Element) {
        enqueue(item)
    }
    
    func remove() -> Element? {
        return dequeue()
    }
}
