//
//  CountdownViewModel.swift
//  WB_HomeWork
//
//  Created by Мария Изюменко on 22.07.2024.
//

import SwiftUI
import Combine

class CountdownViewModel: ObservableObject {
    @Published var secondsRemaining = 60
    @Published var isActive = false
    
    private var timer: AnyCancellable?
    
    func startCountdown() {
        isActive = true
        timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
            .sink { [weak self] _ in
                guard let self = self else { return }
                if self.secondsRemaining > 0 {
                    self.secondsRemaining -= 1
                } else {
                    self.timer?.cancel()
                    self.isActive = false
                }
            }
    }
    
    func resetCountdown() {
        timer?.cancel()
        secondsRemaining = 60
        isActive = false
    }
}
