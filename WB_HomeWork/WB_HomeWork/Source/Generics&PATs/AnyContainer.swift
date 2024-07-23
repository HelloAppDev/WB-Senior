//
//  AnyContainer.swift
//  WB_HomeWork
//
//  Created by Мария Изюменко on 24.07.2024.
//

import Foundation

class AnyContainer<Item>: Container {
    private let addClosure: (Item) -> Void
    private let removeClosure: () -> Item?

    init<C: Container>(_ container: C) where C.Item == Item {
        var container = container
        addClosure = { item in
            container.add(item)
        }

        removeClosure = {
            container.remove()
        }
    }

    func add(_ item: Item) {
        addClosure(item)
    }

    func remove() -> Item? {
        return removeClosure()
    }
}
