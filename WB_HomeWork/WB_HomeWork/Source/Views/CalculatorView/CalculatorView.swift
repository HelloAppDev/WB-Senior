//
//  CalculatorView.swift
//  WB_HomeWork
//
//  Created by Мария Изюменко on 11.08.2024.
//

import SwiftUI

import SwiftUI

struct CalculatorView: View {
    @State private var input = ""
    @State private var result: Double? = nil
    @State private var operation: String? = nil
    @State private var firstOperand: Double? = nil
    
    var body: some View {
        VStack(spacing: 20) {
            resultLabel
            
            enterNumberTextField
            
            HStack {
                plusButton
                
                subtrackButton
                
                multiplicationButton
                
                divisionButton
            }
            
            calculateButton
        }
        .padding()
    }
}

extension CalculatorView {
    @ViewBuilder
    private var resultLabel: some View {
        Text(result != nil ? String(result!) : "0")
            .font(.montserratSemiBold(ofSize: 24))
            .foregroundStyle(Color.white)
            .padding()
    }
    
    @ViewBuilder
    private var enterNumberTextField: some View {
        TextField("Enter number", text: $input)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .keyboardType(.decimalPad)
            .padding(.horizontal, 250)
    }
    
    @ViewBuilder
    private var plusButton: some View {
        CalculatorButtonView(label: "+") {
            performOperation("+")
        }
    }
    
    @ViewBuilder
    private var subtrackButton: some View {
        CalculatorButtonView(label: "-") {
            performOperation("-")
        }
    }
    
    @ViewBuilder
    private var multiplicationButton: some View {
        CalculatorButtonView(label: "*") {
            performOperation("*")
        }
    }
    
    @ViewBuilder
    private var divisionButton: some View {
        CalculatorButtonView(label: "/") {
            performOperation("/")
        }
    }
    
    @ViewBuilder
    private var calculateButton: some View {
        Button(action: calculateResult) {
            Text("=")
                .font(.montserratSemiBold(ofSize: 24))
                .foregroundStyle(Color.white)
                .frame(width: 140, height: 60)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(30)
        }
    }
}

extension CalculatorView {
    private func performOperation(_ op: String) {
        if let value = Double(input) {
            firstOperand = value
            input = ""
            operation = op
        }
    }
    
    private func calculateResult() {
        if let op = operation, let firstValue = firstOperand, let secondValue = Double(input) {
            switch op {
            case "+":
                result = firstValue + secondValue
            case "-":
                result = firstValue - secondValue
            case "*":
                result = firstValue * secondValue
            case "/":
                result = firstValue / secondValue
            default:
                break
            }
            operation = nil
            firstOperand = nil
            input = ""
        }
    }
}

