//
//  ReusableTextfield.swift
//  WB_HomeWork
//
//  Created by Мария Изюменко on 25.07.2024.
//

import SwiftUI

struct ReusableTextfield: View {
    @State var text: String
    
    var body: some View {
        Text(text)
            .foregroundColor(.white)
            .font(.montserratMedium(ofSize: 16))
    }
}
