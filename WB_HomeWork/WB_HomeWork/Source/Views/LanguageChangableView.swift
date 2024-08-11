//
//  LanguageChangableView.swift
//  WB_HomeWork
//
//  Created by Мария Изюменко on 25.07.2024.
//

import SwiftUI

struct LanguageChangableView: View {
    @EnvironmentObject private var languageManager: LanguageManager
    @State private var stringExamples = [
        L10nStrings.boy,
        L10nStrings.car,
        L10nStrings.girl
    ]
    @State private var formatDates: [String] = []
    @State private var distance: Double = 1000.0
    
    var body: some View {
        VStack(spacing: 20) {
            langChangableView
            
            formatView
            
            measureView
        }
        .onTapGesture {
            hideKeyboard()
        }
        .padding()
    }
    
    private func updateDates() {
        formatDates = [
            FormatManager.formatDate(with: languageManager.currentLanguage.rawValue, style: .short),
            FormatManager.formatDate(with: languageManager.currentLanguage.rawValue, style: .medium),
            FormatManager.formatDate(with: languageManager.currentLanguage.rawValue, style: .full)
        ]
    }
}

extension LanguageChangableView {
    @ViewBuilder
    private var langChangableView: some View {
        VStack(spacing: 5) {
            ForEach(stringExamples, id: \.self) {
                Text($0.localize())
                    .foregroundColor(.white)
                    .font(.montserratRegular(ofSize: 16))
            }
            .padding(.top, 10)
            
            Button {
                languageManager.currentLanguage = languageManager.currentLanguage == .english ? .russian
                                                                                              : .english
                updateDates()
            } label: {
                Text(L10nStrings.changeLanguage.localize())
                    .foregroundColor(.white)
                    .font(.montserratMedium(ofSize: 16))
            }
            .padding(.top, 5)
        }
    }
    
    @ViewBuilder
    private var formatView: some View {
        VStack(spacing: 5) {
            Text(L10nStrings.date.localize())
                .font(.montserratRegular(ofSize: 16))
                .foregroundColor(.white)
                .padding(.bottom, 10)
            ForEach(formatDates, id: \.self) {
                Text($0)
                    .font(.montserratRegular(ofSize: 16))
                    .foregroundColor(.white)
            }
        }
    }
    
    @ViewBuilder
    private var measureView: some View {
        VStack(spacing: 5) {
            Text(L10nStrings.distance.localize())
                .font(.montserratRegular(ofSize: 16))
                .font(.montserratMedium(ofSize: 16))
                .foregroundColor(.white)
            TextField("", value: $distance, formatter: NumberFormatter())
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal, 500)
                .keyboardType(.decimalPad)
            Text("\(FormatManager.formatDistance(with: languageManager.currentLanguage.rawValue, distance: distance, unit: .kilometers))")
                .font(.montserratMedium(ofSize: 16))
                .foregroundColor(.white)
                .padding()
            Text("\(FormatManager.formatDistance(with: languageManager.currentLanguage.rawValue, distance: distance, unit: .miles))")
                .font(.montserratMedium(ofSize: 16))
                .foregroundColor(.white)
                .padding()
        }
        .padding()
    }
}


extension LanguageChangableView: Stubbable {
    static func stub() -> any View {
        return LanguageChangableView().environmentObject(LanguageManager())
    }
}
