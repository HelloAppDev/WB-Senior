//
//  InputCodeView.swift
//  wb_client
//
//  Created by Мария Изюменко on 30.06.2024.
//

import SwiftUI

private enum Constants {
    static let mailImage = "mail"
    static let correctCode = "Correct Code"
    static let authTitle = "Авторизоваться"
}

struct AuthCodeView: View {
    @StateObject private var viewModel: AuthViewModel
    @StateObject private var countdownViewModel: CountdownViewModel = .init()
    @State private var isButtonEnabled = true
    @State private var countdownFinished = false
    
    init(phoneNumber: String) {
        let viewModel = AuthViewModel()
        viewModel.phoneNumber = phoneNumber
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        VStack {
            Image(Constants.mailImage)
                .padding([.top], 20)
            PhoneNumberView(phoneNumber: "+7 (777) 777-77-77")
            CodeInputFieldView(code: $viewModel.code,
                               isValid: viewModel.isValid,
                               shouldShowBorders: viewModel.shouldShowBorders)
            Text(viewModel.statusMessage)
                .foregroundColor(viewModel.statusMessage == Constants.correctCode ? .green : .red)
                .padding(.top, -15)
                .font(.montserratMedium(ofSize: 14))
            CountdownView(viewModel: countdownViewModel)
                .onChange(of: countdownViewModel.countdownFinished) { oldValue, newValue in
                    if newValue {
                        isButtonEnabled = true
                    }
                }
                .onAppear {
                    countdownViewModel.startCountdown()
                }
                .frame(maxWidth: .infinity, alignment: .center)
                .padding([.bottom, .top], 15)
            AccentButton(text: Constants.authTitle) {
                viewModel.validateCode()
            }
        }
        .customVStackStyle()
        .onTapGesture {
            hideKeyboard()
        }
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthCodeView(phoneNumber: "")
    }
}

