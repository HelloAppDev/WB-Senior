//
//  CargoView.swift
//  WB_HomeWork
//
//  Created by Мария Изюменко on 25.07.2024.
//

import SwiftUI

struct CargoView: View {
    @State private var cargos: [Cargo] = []
    
    var body: some View {
        VStack(spacing: 20) {
            if let firstCargo = cargos[safe: 0] {
                ReusableTextfield(text: "First cargo is: \(firstCargo.volume) m\u{00B3}")
            } else {
                ReusableTextfield(text: "First cargo not found")
            }
            
            if let secondCargo = cargos[safe: 1] {
                ReusableTextfield(text: "Second cargo is: \(secondCargo.volume) m\u{00B3}")
            } else {
                ReusableTextfield(text: "Second cargo not found")
            }
            
            if let firstCargo = cargos[safe: 0], let secondCargo = cargos[safe: 1] {
                let combinedCargoVolume = firstCargo +++ secondCargo
                ReusableTextfield(text: "Combined cargo is: \(combinedCargoVolume) m\u{00B3}")
            } else {
                ReusableTextfield(text: "Unable to combine cargos")
            }
        }
        .padding()
        .onAppear {
            loadCargos()
        }
    }
    
    private func loadCargos() {
        cargos = [
            Cargo(width: 2.0, height: 3.0, depth: 4.0),
            Cargo(width: 1.5, height: 2.5, depth: 3.5)
        ]
    }
}

extension CargoView: Stubbable {
    static func stub() -> any View {
        return CargoView()
    }
}
