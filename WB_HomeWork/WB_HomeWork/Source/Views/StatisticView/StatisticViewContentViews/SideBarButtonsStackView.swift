//
//  SideBarButtonsStackView.swift
//  WB_HomeWork
//
//  Created by Мария Изюменко on 08.08.2024.
//

import SwiftUI

struct SideBarButtonsStackView: View {
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    @Binding private var selectedItem: TabBarItems
    let gradient: CustomGradient = .lightPink

    private let itemTypes: [TabBarItems]
    private var stackSpacing: CGFloat {
        return 68
    }

    private var gradientRectangleSide: CGFloat {
        return 48
    }

    init(selectedItem: Binding<TabBarItems>,
        itemTypes: [TabBarItems]) {
        _selectedItem = selectedItem
        self.itemTypes = itemTypes
    }

    var body: some View {
        VStack(spacing: stackSpacing) {
            ForEach(itemTypes, id: \.self) { item in
                Button(action: {
                    withAnimation {
                        selectedItem = item
                    }
                }) {
                    Image(uiImage: item.icon ?? UIImage())
                        .resizable()
                        .scaledToFill()
                        .frame(width: 24, height: 24)
                        .background(selectedItem == item ? AnyView(gradientRectangle) : AnyView(Color.clear))
                        .foregroundColor(.white)
                }
            }
        }
    }
}

private extension SideBarButtonsStackView {
    @ViewBuilder
    private var gradientRectangle: some View {
        Rectangle()
            .fill(LinearGradient(
                gradient: Gradient(colors: gradient.colors),
                startPoint: .top,
                endPoint: .bottom
            ))
            .frame(width: gradientRectangleSide, height: gradientRectangleSide)
            .cornerRadius(horizontalSizeClass == .compact ? 8 : 16)
            .shadow(
                color: Color("shadowColor"),
                radius: 40,
                x: 0,
                y: 0
            )
    }
}

extension SideBarButtonsStackView: Stubbable {
    static func stub() -> any View {
        @State var selectedItem: TabBarItems = .charts
        return SideBarButtonsStackView(selectedItem: $selectedItem,
                                       itemTypes: TabBarItems.allCases)
    }
}
