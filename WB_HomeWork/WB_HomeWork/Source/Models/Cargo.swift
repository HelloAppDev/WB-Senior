//
//  Cargo.swift
//  WB_HomeWork
//
//  Created by Мария Изюменко on 25.07.2024.
//

import Foundation

struct Cargo {
    var width: Double
    var height: Double
    var depth: Double
    
    var volume: Double {
        return width * height * depth
    }
}

infix operator +++
func +++(lhs: Cargo, rhs: Cargo) -> Double {
    return lhs.volume + rhs.volume
}
