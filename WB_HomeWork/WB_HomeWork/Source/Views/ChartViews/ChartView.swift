//
//  ChartView.swift
//  WB_HomeWork
//
//  Created by Мария Изюменко on 12.08.2024.
//

import SwiftUI
import Charts

struct InteractiveChartView: View {
    let data: [Double]
    let lineColor: Color
    let areaColors: [Color]
    @State private var selectedPoint: CGPoint? = nil
    @State private var selectedValue: Double? = nil
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                areaChart
                
                lineChart
                
                tapableRectangle
                
                toolTipView
            }
            .onChange(of: geometry.size) { newSize in
                recalculateSelectedPoint(for: newSize)
            }
        }
    }
}

extension InteractiveChartView {
    @ViewBuilder
    private var areaChart: some View {
        Chart(data: data)
            .chartStyle(
                AreaChartStyle(.quadCurve, fill:
                                LinearGradient(colors: areaColors,
                                               startPoint: .top,
                                               endPoint: .bottom))
            )
    }
    
    @ViewBuilder
    private var lineChart: some View {
        Chart(data: data)
            .chartStyle(
                LineChartStyle(.quadCurve,
                               lineColor: lineColor,
                               lineWidth: 5)
            )
    }
    
    @ViewBuilder
    private var tapableRectangle: some View {
        GeometryReader { geometry in
            Rectangle()
                .fill(Color.clear)
                .contentShape(Rectangle())
                .gesture(
                    DragGesture(minimumDistance: 0)
                        .onEnded { value in
                            let touchLocation = value.location
                            let chartWidth = geometry.size.width
                            let chartHeight = geometry.size.height
                            
                            let step = chartWidth / CGFloat(data.count - 1)
                            let index = Int(round(touchLocation.x / step))
                            
                            if index >= 0 && index < data.count {
                                selectedValue = data[index]
                                let xPos = step * CGFloat(index)
                                let yPos = chartHeight * (1 - CGFloat(data[index])) - 20
                                selectedPoint = CGPoint(x: xPos, y: yPos)
                            } else {
                                selectedPoint = nil
                                selectedValue = nil
                            }
                        }
                )
        }
    }
    
    @ViewBuilder
    private var toolTipView: some View {
        if let selectedPoint = selectedPoint,
           let selectedValue = selectedValue {
            TooltipView(value: selectedValue)
                .position(x: selectedPoint.x, y: selectedPoint.y)
        }
    }
}

extension InteractiveChartView {
    private func recalculateSelectedPoint(for newSize: CGSize) {
        guard let selectedValue = selectedValue else { return }
        
        let chartWidth = newSize.width
        let chartHeight = newSize.height
        
        let step = chartWidth / CGFloat(data.count - 1)
        let index = data.firstIndex(of: selectedValue) ?? 0
        let xPos = step * CGFloat(index)
        
        let yPos = chartHeight * (1 - CGFloat(selectedValue)) - 20
        
        selectedPoint = CGPoint(x: xPos, y: yPos)
    }
}
