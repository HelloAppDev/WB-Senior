//
//  CountdownView.swift
//  WB_HomeWork
//
//  Created by Мария Изюменко on 22.07.2024.
//

import SwiftUI

struct CountdownView: View {
    @StateObject private var viewModel = CountdownViewModel()
    
       var body: some View {
           if viewModel.isActive {
               Text("Запросить повторно через \(viewModel.secondsRemaining) сек")
                   .onAppear {
                       viewModel.startCountdown()
                   }
                   .onDisappear {
                       viewModel.resetCountdown()
                   }
           }
       }
}

#Preview {
    CountdownView()
}
