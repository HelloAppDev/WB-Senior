//
//  TopBarView.swift
//  WB_HomeWork
//
//  Created by Мария Изюменко on 08.08.2024.
//

import SwiftUI

private enum Constants {
    static let statisticsTitle = "Статистика"
    static let showWidgets = "Отображение виджетов"
    static let shareTitle = "Поделиться"
    static let slidersIcon = "slidersIcon"
    static let shareIcon = "shareIcon"
}

struct TopBarView: View {
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    @ObservedObject var store: StatisticsStore<StatisticView.State, StatisticView.Action>

    var body: some View {
        HStack(spacing: 24) {
            statisticsLabel
            Spacer()
            widgetsButton
            shareButton
        }
        .padding(.init(top: 32, leading: 30, bottom: 24, trailing: 24))
    }
}

private extension TopBarView {
    @ViewBuilder
    private var statisticsLabel: some View {
        Text(Constants.statisticsTitle)
            .foregroundColor(.white)
            .font(.montserratSemiBold(ofSize: 24))
    }

    @ViewBuilder
    private var widgetsButton: some View {
        IconTitledButton(text: horizontalSizeClass == .regular ? Constants.showWidgets : "",
                         image: UIImage(named: Constants.slidersIcon) ?? UIImage()) {
            store.dispatch(action: .showWidgets)
        }
    }
    
    @ViewBuilder
    private var shareButton: some View {
        IconTitledButton(text: horizontalSizeClass == .regular ? Constants.shareTitle : "",
                         image: UIImage(named: Constants.shareIcon) ?? UIImage()) {
            store.dispatch(action: .share)
        }
    }
}

extension TopBarView: Stubbable {
    static func stub() -> any View {
        return TopBarView(store: .init(state: .main, reducer: { _,_ in return .share }))
    }
}
