//
//  LanguageManager.swift
//  WB_HomeWork
//
//  Created by Мария Изюменко on 25.07.2024.
//

import SwiftUI

class LanguageManager: ObservableObject {
    enum Language: String {
        case russian = "ru"
        case english = "en"
    }
    
    @Published public var currentLanguage: Language = .russian {
        didSet {
            UserDefaults.standard.set([currentLanguage.rawValue], forKey: "AppleLanguages")
            UserDefaults.standard.synchronize()
            Bundle.setLanguage(currentLanguage.rawValue)
        }
    }
}
