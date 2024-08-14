//
//  ContentView.swift
//  WB_HomeWork
//
//  Created by Мария Изюменко on 22.07.2024.
//

import SwiftUI
import Charts

private enum Constants {
    static let chevronImage = "chevron.left"
    static let goBackTitle = "Вернуться назад"
}

struct ContentView: View {
    let data: [Double] = [0.1, 0.3, 0.2, 0.5, 0.7, 0.3]
    
    var body: some View {
        BackgroundView(image: UIImage(named: "purpleBackground")) {
            ZStack {
                SideTabBarView()
//                InteractiveChartView(data: data,
//                                     lineColor: .blue,
//                                     areaColors: [Color.lightBlue, Color.darkBlue.opacity(0.1)])
            }
        }
    }
}

#Preview {
    ContentView()
}
