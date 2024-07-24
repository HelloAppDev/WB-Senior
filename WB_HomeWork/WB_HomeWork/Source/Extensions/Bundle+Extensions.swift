//
//  Bundle+Extensions.swift
//  WB_HomeWork
//
//  Created by Мария Изюменко on 25.07.2024.
//

import SwiftUI

extension Bundle {
    private static var bundleKey: UInt8 = 0
    
    static func setLanguage(_ language: String) {
        guard let path = Bundle.main.path(forResource: language, ofType: "lproj"),
              let bundle = Bundle(path: path) else {
            return
        }
        
        objc_setAssociatedObject(Bundle.main, &bundleKey, bundle, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        object_setClass(Bundle.main, LanguageBundle.self)
    }

    private class LanguageBundle: Bundle {
        override func localizedString(forKey key: String, value: String?, table tableName: String?) -> String {
            let bundle = objc_getAssociatedObject(self, &Bundle.LanguageBundle.bundleKey) as? Bundle
            return bundle?.localizedString(forKey: key, value: value, table: tableName) ?? super.localizedString(forKey: key, value: value, table: tableName)
        }
    }
}
