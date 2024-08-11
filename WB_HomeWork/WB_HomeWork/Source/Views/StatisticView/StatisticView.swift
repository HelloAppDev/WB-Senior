//
//  StatisticView.swift
//  WB_HomeWork
//
//  Created by Мария Изюменко on 08.08.2024.
//

import SwiftUI

struct StatisticView: View {
    @ObservedObject var store = StatisticsStore<State, Action>(state: .main) { prevState, action in
        switch action {
        case .showMain:
            return .main
        case .showWidgets:
            return .widgets
        case .share:
            return .share
        }
    }

    var body: some View {
        SideBarView() {
            contentView
        }
    }
}

extension StatisticView {
    enum State {
        case main
        case widgets
        case share
    }

    enum Action {
        case showMain
        case showWidgets
        case share
    }
}

private extension StatisticView {
    @ViewBuilder
    private var contentView: some View {
        VStack(spacing: 0) {
            TopBarView(store: store)
            StatisticViewContent()
        }
    }
}

final class StatisticsStore<State, Action>: ObservableObject {
    typealias Reducer = (State, Action) -> State

    @Published var state: State

    private let reducer: Reducer

    init(state: State, reducer: @escaping Reducer) {
        self.state = state
        self.reducer = reducer
    }
}

extension StatisticsStore {
    func dispatch(action: Action) {
        state = reducer(state, action)
    }
}
