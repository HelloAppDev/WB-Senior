//
//  CountdownView.swift
//  WB_HomeWork
//
//  Created by Мария Изюменко on 22.07.2024.
//

import SwiftUI

private enum Constants {
    static let requestAgainTitle = "Запросить повторно"
}

struct CountdownView: View {
    @ObservedObject var viewModel: CountdownViewModel

    var body: some View {
        if viewModel.isActive {
            Text("Запросить повторно через \(viewModel.secondsRemaining) сек")
                .font(.montserratMedium(ofSize: 14))
                .foregroundColor(Color.white)
                .onAppear {
                    viewModel.startCountdown()
                }
                .onDisappear {
                    viewModel.resetCountdown()
                }
        } else {
            Button(Constants.requestAgainTitle) {
                viewModel.startCountdown()
            }
            .opacity(viewModel.isActive ? 0 : 1)
            .font(.montserratMedium(ofSize: 14))
            .foregroundColor(Color.white)
        }
    }
}
