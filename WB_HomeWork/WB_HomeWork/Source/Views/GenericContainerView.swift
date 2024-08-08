//
//  GenericContainerView.swift
//  WB_HomeWork
//
//  Created by Мария Изюменко on 24.07.2024.
//

import SwiftUI

struct GenericContainerView: View {
    var body: some View {
        Text("Hello, Generics!")
            .foregroundColor(.white)
            .onAppear() {
                start()
            }
    }
}

extension GenericContainerView {
    private func makeOpaqueContainer<T>(with item: T) -> some Container {
        var stack = Stack<T>()
        stack.add(item)
        return stack
    }
    
    private func start() {
        var intStack = Stack<Int>()
        intStack.push(5)
        intStack.push(10)
        print(intStack.pop())
        print(intStack.pop())
        print(intStack.pop())
        
        var stringQueue = Queue<String>()
        stringQueue.enqueue("Hello")
        stringQueue.enqueue("Queue")
        print(stringQueue.dequeue())
        print(stringQueue.dequeue())
        print(stringQueue.dequeue())
        
        var opaqueIntContainer = makeOpaqueContainer(with: 100)
        if let removedItem = opaqueIntContainer.remove() {
            print(removedItem)
        }
        
        var opaqueStringContainer = makeOpaqueContainer(with: "Queue")
        if let removedItem = opaqueStringContainer.remove() {
            print(removedItem)
        }
        
        let anyIntContainer = AnyContainer(intStack)
        anyIntContainer.add(15)
        anyIntContainer.add(20)
        print(anyIntContainer.remove())
        print(anyIntContainer.remove())
        print(anyIntContainer.remove())
        
        let anyStringContainer = AnyContainer(stringQueue)
        anyStringContainer.add("Hello")
        anyStringContainer.add("World!")
        print(anyStringContainer.remove())
        print(anyStringContainer.remove())
        print(anyStringContainer.remove())
    }
}

#Preview {
    GenericContainerView()
}
