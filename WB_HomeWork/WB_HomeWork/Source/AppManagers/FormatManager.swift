//
//  FormatManager.swift
//  WB_HomeWork
//
//  Created by Мария Изюменко on 25.07.2024.
//

import Foundation

struct FormatManager {
    static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        return formatter
    }()
    
    static let measureFormatter: MeasurementFormatter = {
        let formatter = MeasurementFormatter()
        return formatter
    }()
    
    static func formatDate(with languageId: String, style: DateFormatter.Style) -> String {
        dateFormatter.locale = Locale(identifier: "\(languageId)_\(Locale.current.region?.identifier ?? "RU")")
        dateFormatter.dateStyle = style
        dateFormatter.timeStyle = style
        return dateFormatter.string(from: Date())
    }
    
    static func formatDistance(with languageId: String, distance: Double, unit: UnitLength) -> String {
        let measurement = Measurement(value: distance, unit: UnitLength.meters).converted(to: unit)
        measureFormatter.locale = Locale(identifier: "\(languageId)_\(Locale.current.region?.identifier ?? "RU")")
        measureFormatter.unitOptions = .providedUnit
        return measureFormatter.string(from: measurement)
    }
}
