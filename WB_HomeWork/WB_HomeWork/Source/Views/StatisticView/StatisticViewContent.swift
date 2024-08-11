//
//  StatisticViewContent.swift
//  WB_HomeWork
//
//  Created by Мария Изюменко on 08.08.2024.
//

import SwiftUI

struct StatisticViewContent: View {
    var body: some View {
        Grid(horizontalSpacing: 0, verticalSpacing: 24) {
            GridRow {
                salesChartsView
            }
            Grid(horizontalSpacing: 24, verticalSpacing: 24) {
                GridRow {
                    marketingSpecialistsView
                    Grid(horizontalSpacing: 0, verticalSpacing: 24) {
                        GridRow {
                            trafficView
                        }
                        GridRow {
                            techSupportView
                        }
                    }
                }
            }
        }
        .padding(.init(top: 0, leading: 30, bottom: 32, trailing: 24))
    }
}

private extension StatisticViewContent {
    @ViewBuilder
    private var salesChartsView: some View {
        SalesChartsView()
    }

    @ViewBuilder
    private var marketingSpecialistsView: some View {
        MarketingSpecialistsView()
    }

    @ViewBuilder
    private var trafficView: some View {
        TrafficView()
    }

    @ViewBuilder
    private var techSupportView: some View {
        TechSupportView()
    }
}
