//
//  InputCodeView.swift
//  wb_client
//
//  Created by Мария Изюменко on 30.06.2024.
//

import SwiftUI

struct AuthCodeView: View {
    @StateObject private var viewModel: AuthViewModel = .init()
    
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
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthCodeView()
    }
}

