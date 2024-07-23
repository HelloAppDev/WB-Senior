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
    @StateObject private var viewModel: AuthViewModel = .init()
    @StateObject private var countdownViewModel: CountdownViewModel = .init()
    @State private var isButtonEnabled = true
    @State private var countdownFinished = false
    
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
                .onChange(of: countdownViewModel.countdownFinished) { newValue in
                    if newValue {
                        isButtonEnabled = true
                    }
                }
                .onAppear {
                    countdownViewModel.startCountdown()
                }
                .frame(maxWidth: .infinity, alignment: .center)
                .padding([.bottom, .top], 15)
            Button(action: {
                viewModel.validateCode()
            }) {
                Text(Constants.authTitle)
                    .foregroundColor(.white)
                    .font(.montserratMedium(ofSize: 16))
            }
            .padding(.horizontal, 110)
            .frame(height: 48)
            .background(Color.buttonColor)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding([.bottom], 30)
        }
        .padding()
        .background(Color.black.opacity(0.3))
        .cornerRadius(28)
        .frame(maxWidth: 400)
        .padding()
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthCodeView()
    }
}

