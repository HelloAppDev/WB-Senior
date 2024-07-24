//
//  LanguageChangableView.swift
//  WB_HomeWork
//
//  Created by Мария Изюменко on 25.07.2024.
//

import SwiftUI

struct LanguageChangableView: View {
    @StateObject private var languageManager = LanguageManager()
    @State private var stringExamples = [
        L10nStrings.boy,
        L10nStrings.car,
        L10nStrings.girl
    ]
    
    var body: some View {
        VStack(spacing: 20) {
            langChangableView
        }
        .padding()
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
            .padding(.top, 40)
            
            Button {
                languageManager.currentLanguage = languageManager.currentLanguage == .english ? .russian
                                                                                              : .english
                print(languageManager.currentLanguage)
            } label: {
                Text(L10nStrings.changeLanguage.localize())
                    .foregroundColor(.white)
            }
        }
    }
}
