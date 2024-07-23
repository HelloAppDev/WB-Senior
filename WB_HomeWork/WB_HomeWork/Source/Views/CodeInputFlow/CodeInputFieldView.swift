//
//  CodeInputFieldView.swift
//  wb_client
//
//  Created by Мария Изюменко on 30.06.2024.
//

import SwiftUI

struct CodeInputFieldView: View {
    @Binding var code: String
    var isValid: Bool
    var shouldShowBorders: Bool
    
    var body: some View {
        ZStack {
            CodeInputView(code: $code,
                          isValid: isValid,
                          shouldShowBorders: shouldShowBorders)
            
            TextField("", text: $code)
                .tint(.clear)
                .font(.montserratMedium(ofSize: 36))
                .keyboardType(.numberPad)
                .foregroundColor(.clear)
                .background(.clear)
                .onChange(of: code) { oldValue, newValue in
                    let filtered = newValue.filter { $0.isNumber }
                    if filtered.count > 4 {
                        code = String(filtered.prefix(4))
                    } else {
                        code = filtered
                    }
                }
        }
        .padding()
    }
}

struct CodeInputFieldView_Previews: PreviewProvider {
    @State static var code = "1221"
    
    static var previews: some View {
        CodeInputFieldView(code: $code, isValid: true, shouldShowBorders: true)
    }
}
