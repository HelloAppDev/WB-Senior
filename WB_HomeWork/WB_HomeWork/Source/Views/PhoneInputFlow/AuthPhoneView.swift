//
//  AuthPhoneView.swift
//  wb_client
//
//  Created by Мария Изюменко on 13.07.2024.
//

import SwiftUI

private enum Constants {
    static let authTitle = "Авторизация"
    static let userImage = "avatarImage"
    static let subtitle = "Вход по номеру телефона"
    static let reqCode = "Запросить код"
}

struct AuthPhoneView: View {
    @State private var phoneNumber: String = .init()
    
    var body: some View {
        VStack(spacing: 20) {
            Text(Constants.authTitle)
                .font(.montserratSemiBold(ofSize: 24))
                .padding([.top], 15)
                .foregroundColor(.white)
            
            Image(Constants.userImage)
            
            Text(Constants.subtitle)
                .foregroundColor(.white)
                .font(.montserratRegular(ofSize: 16))
                .padding([.bottom], -24)
            
            PhoneNumberTextField(phoneNumber: $phoneNumber)
                .padding([.bottom], -17)
                .padding(.horizontal, -5)
            AccentButton(text: Constants.reqCode) {
                // Navigate
            }
        }
        .customVStackStyle()
        .onTapGesture {
            hideKeyboard()
        }
    }
}

#Preview {
    AuthPhoneView()
}
