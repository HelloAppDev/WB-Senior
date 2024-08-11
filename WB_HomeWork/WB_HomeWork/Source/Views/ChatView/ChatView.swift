//
//  ChatView.swift
//  WB_HomeWork
//
//  Created by Мария Изюменко on 11.08.2024.
//

import SwiftUI

private enum Constants {
    static let title = "Chat"
    static let sendTitle = "Send"
    static let textFieldPlaceholder = "Enter message"
}

struct ChatView: View {
    @ObservedObject var multipeerManager = MultipeerManager()
    @State private var messageText = ""
    
    var body: some View {
        NavigationView {
            VStack {
                List(multipeerManager.messages, id: \.self) { message in
                    Text(message)
                }
                .listStyle(PlainListStyle())
                
                HStack {
                    messageTextField
                    
                    sendButton
                }
                .padding(.horizontal)
            }
            .navigationTitle(Constants.title)
            .padding(.horizontal)
        }
    }
}

extension ChatView {
    @ViewBuilder
    private var messageTextField: some View {
        TextField(Constants.textFieldPlaceholder, text: $messageText)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding(.leading)
    }

    @ViewBuilder
    private var sendButton: some View {
        Button(action: {
            if !messageText.isEmpty {
                multipeerManager.send(message: messageText)
                messageText = ""
            }
        }) {
            Text(Constants.sendTitle)
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
        }
        .padding(.trailing)
    }
}

