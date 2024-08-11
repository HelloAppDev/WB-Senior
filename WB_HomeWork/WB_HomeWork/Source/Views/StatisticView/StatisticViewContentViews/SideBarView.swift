//
//  SideBarView.swift
//  WB_HomeWork
//
//  Created by Мария Изюменко on 08.08.2024.
//

import SwiftUI

private enum ShowState {
    case opened
    case closed

    var offset: CGFloat {
        switch self {
        case .opened:
            return 0
        case .closed:
            return 320
        }
    }
}

private enum Constants {
    static let sideViewWidth: CGFloat = 320.0
}

struct SideBarView<Content>: View where Content: View {
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    @State private var showType: ShowState = .closed
    @State private var sideOffset: CGFloat = Constants.sideViewWidth
    @State private var contentSpacing: CGFloat = Constants.sideViewWidth
    private var gradient: CustomGradient = .darkPurple

    private let content: Content

    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content()
    }

    var body: some View {
        ZStack(alignment: .trailing) {
            content
                .padding(.trailing, horizontalSizeClass == .compact ? 0 : contentSpacing)
            sideView
        }
        .animation(.easeInOut, value: sideOffset)
        .onAppear {
            showType = horizontalSizeClass == .compact ? .closed : .opened
            sideOffset = showType.offset
        }
    }
}

private extension SideBarView {
    @ViewBuilder
    private var sideView: some View {
        GradientBackgroundView(gradient: gradient,
                               points: (.leading, .trailing)) {}
            .frame(width: Constants.sideViewWidth)
            .cornerRadius(44, corners: [.topLeft, .bottomLeft])
            .offset(x: sideOffset)
            .gesture(
                DragGesture()
                    .onChanged { value in
                        if showType == .opened {
                            if value.translation.width > 0 {
                                sideOffset = min(Constants.sideViewWidth, value.translation.width)
                                contentSpacing = Constants.sideViewWidth - sideOffset
                            }
                        } else {
                            if value.translation.width < 0 {
                                sideOffset = max(0, Constants.sideViewWidth + value.translation.width)
                                contentSpacing = Constants.sideViewWidth - sideOffset
                            }
                        }
                    }
                    .onEnded { value in
                        if showType == .opened {
                            if value.translation.width > Constants.sideViewWidth / 2 {
                                closeSideBar()
                            } else {
                                openSideBar()
                            }
                        } else {
                            if value.translation.width < -(Constants.sideViewWidth / 2) {
                                openSideBar()
                            } else {
                                closeSideBar()
                            }
                        }
                    }
            )
            .edgesIgnoringSafeArea(.all)
    }
}

extension SideBarView {
    private func openSideBar() {
        showType = .opened
        sideOffset = showType.offset
        contentSpacing = Constants.sideViewWidth - sideOffset
    }

    private func closeSideBar() {
        showType = .closed
        sideOffset = showType.offset
        contentSpacing = Constants.sideViewWidth - sideOffset
    }
}

extension SideBarView: Stubbable {
    static func stub() -> any View {
        return HStack(spacing: 0) {
            Spacer()
            SideBarView<EmptyView>() {}
        }
    }
}
