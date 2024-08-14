//
//  StatsticContentViews.swift
//  WB_HomeWork
//
//  Created by Мария Изюменко on 08.08.2024.
//

import SwiftUI

struct TechSupportView: View {
    var body: some View {
        Color.black.opacity(0.4)
            .frame(height: 134)
            .cornerRadius(28)
    }
}

struct MarketingSpecialistsView: View {
    var body: some View {
        Color.black.opacity(0.4)
            .frame(height: 438)
            .cornerRadius(28)
    }
}

struct TrafficView: View {
    var body: some View {
        Color.black.opacity(0.4)
            .frame(height: 280)
            .cornerRadius(28)
    }
}

struct SalesChartsView: View {
    let yAxisValues: [Int] = [0, 200, 400, 600, 800, 999]
    let months: [String] = [
        "Янв","Фев","Мар",
        "Апр","Май","Июн",
        "Июл","Авг","Сен",
        "Окт","Ноя","Дек"
    ]
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.4)
                .frame(height: 445)
                .cornerRadius(28)
            VStack {
                HStack {
                    valuesView
                    dividerView
                }
                HStack {
                    monthView
                }
            }
            .padding([.top, .leading, .trailing])
        }
        .padding(.bottom, 0)
    }
}

extension SalesChartsView {
    @ViewBuilder
    private var valuesView: some View {
        VStack(alignment: .trailing) {
            ForEach(yAxisValues.reversed(), id: \.self) { value in
                Text("\(value)")
                    .font(.montserratMedium(ofSize: 12))
                    .foregroundColor(.gray)
                    .frame(height: 40)
            }
        }
    }
    
    @ViewBuilder
    private var dividerView: some View {
        VStack(spacing: 0) {
            ForEach(0..<yAxisValues.count) { _ in
                Divider()
                    .background(Color.gray.opacity(0.3))
                    .frame(height: 50)
            }
        }
    }
    
    @ViewBuilder
    private var monthView: some View {
        ForEach(months, id: \.self) { month in
            Text(month)
                .font(.montserratMedium(ofSize: 12))
                .foregroundColor(.gray)
                .frame(maxWidth: .infinity)
        }
    }
}

#Preview {
    SalesChartsView()
}


struct Line: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: rect.width, y: 0))
        return path
    }
}
