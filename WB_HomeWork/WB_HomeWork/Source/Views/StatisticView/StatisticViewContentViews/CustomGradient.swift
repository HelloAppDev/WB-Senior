//
//  CustomGradient.swift
//  WB_HomeWork
//
//  Created by Мария Изюменко on 08.08.2024.
//

import SwiftUI

enum CustomGradient {
    case lightPink
    case darkPurple
    
    var colors: [Color] {
        switch self {
        case .lightPink:
            return [Color("pinkColor"),
                    Color("darkPinkColor")]
        case .darkPurple:
            return [Color("ligthPurpleColor"),
                    Color("darkPurpleColor")]
        }
    }
}
