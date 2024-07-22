//
//  InputCodeView.swift
//  wb_client
//
//  Created by Мария Изюменко on 30.06.2024.
//

import SwiftUI

struct AuthCodeView: View {
    @StateObject private var viewModel: AuthViewModel = .init()
    @State private var isButtonEnabled = true
    @State private var countdownFinished = false
    
    var body: some View {
            VStack {
                Image("mail")
                    .padding([.top], 40)
                PhoneNumberView()
                CodeInputFieldView(code: $viewModel.code,
                                   isValid: viewModel.isValid,
                                   shouldShowBorders: viewModel.shouldShowBorders)
                Text(viewModel.statusMessage)
                    .foregroundColor(viewModel.statusMessage == "Correct Code" ? .green : .red)
                    .padding(.top, -30)
                    .font(.montserratMedium(ofSize: 14))
                CountdownView()
                    .onChange(of: countdownFinished) { newValue in
                        if newValue {
                            isButtonEnabled = true
                        }
                    }
                    .padding(.bottom, 20)
                Button(action: {
                    viewModel.validateCode()
                }) {
                    Text("Авторизоваться")
                        .foregroundColor(.white)
                        .font(.montserratMedium(ofSize: 16))
                }
                .padding(.horizontal, 90)
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
    
    private func startCountdown() {
        isButtonEnabled = false
        countdownFinished = false
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 60) {
            countdownFinished = true
        }
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthCodeView()
    }
}

