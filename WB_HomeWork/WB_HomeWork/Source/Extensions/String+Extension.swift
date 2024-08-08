//
//  String+Extension.swift
//  WB_HomeWork
//
//  Created by Мария Изюменко on 25.07.2024.
//

import SwiftUI

extension String {
    func localize() -> String {
        return NSLocalizedString(self, comment: "")
    }
}
