//
//  Collection+Extensions.swift
//  WB_HomeWork
//
//  Created by Мария Изюменко on 25.07.2024.
//

import Foundation

extension Collection {
    subscript(safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
