//
//  PhoneNumberView.swift
//  wb_client
//
//  Created by Мария Изюменко on 30.06.2024.
//

import SwiftUI

struct PhoneNumberView: View {
    var phoneNumber: String
    
    var body: some View {
        Text(phoneNumber)
            .font(.montserratSemiBold(ofSize: 24))
            .foregroundColor(.white)
            .padding()
    }
}
