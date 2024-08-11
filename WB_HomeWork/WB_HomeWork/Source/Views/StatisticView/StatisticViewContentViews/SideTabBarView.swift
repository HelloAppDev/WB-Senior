//
//  SideTabBarView.swift
//  WB_HomeWork
//
//  Created by Мария Изюменко on 08.08.2024.
//

import SwiftUI

enum TabBarItems: CaseIterable {
    case charts
    case chat
    case flame
    case calendar
    case settings
    
    var icon: UIImage? {
        switch self {
        case .charts:
            return UIImage(named: "chartsIcon")
        case .chat:
            return UIImage(named: "chatIcon")
        case .flame:
            return UIImage(named: "flameIcon")
        case .calendar:
            return UIImage(named: "calendarIcon")
        case .settings:
            return UIImage(named: "settingsIcon")
        }
    }
}

struct SideTabBarView: View{
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    @State private var selectedItem: TabBarItems = .charts

    private var verticalOffset: CGFloat {
        return 32
    }

    private var imageSideSize: CGFloat {
        return 44
    }

    private var buttonSideSize: CGFloat {
        return 48
    }
    
    var body: some View {
        ZStack {
            HStack(spacing: 0) {
                tabBar
                selectedScreen
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .frame(minWidth: 0,
                   maxWidth: horizontalSizeClass == .compact ? UIScreen.main.bounds.width : .infinity,
                   minHeight: 0,
                   maxHeight: .infinity,
                   alignment: .leading)
            .statusBar(hidden: true)
        }
    }
}

private extension SideTabBarView {
    @ViewBuilder
    private var tabBar: some View {
        GradientBackgroundView(gradient: .darkPurple,
                               points: (.leading, .trailing)) {
                VStack(spacing: 0) {
                    circledImage
                    Spacer()
                    buttonsStackView
                    Spacer()
                    addButton
                }
            }
            .frame(minWidth: 80)
            .fixedSize(horizontal: true, vertical: false)
    }

    @ViewBuilder
    private var selectedScreen: some View {
        switch selectedItem {
        case .charts:
            StatisticView()
        case .chat:
            StatisticView()
        case .flame:
            StatisticView()
        case .calendar:
            StatisticView()
        case .settings:
            StatisticView()
        }
    }

    @ViewBuilder
    private var circledImage: some View {
        CircleImage(image: UIImage(named: "avatarImage") ?? UIImage(),
                    sideSize: imageSideSize)
        .padding(.top, verticalOffset)
    }

    @ViewBuilder
    private var buttonsStackView: some View {
        SideBarButtonsStackView(selectedItem: $selectedItem,
                                itemTypes: TabBarItems.allCases)
    }

    @ViewBuilder
    private var addButton: some View {
        Button(action: {}) {
            Image(uiImage: UIImage(named: "plus-circleIcon") ?? UIImage())
            .resizable()
            .scaledToFill()
        }
        .frame(width: buttonSideSize, height: buttonSideSize)
        .padding(.bottom, verticalOffset)
    }
}

extension SideTabBarView: Stubbable {
    static func stub() -> any View {
        return SideTabBarView()
    }
}
