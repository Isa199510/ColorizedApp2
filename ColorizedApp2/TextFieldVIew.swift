//
//  TextFieldVIew.swift
//  ColorizedApp2
//
//  Created by Иса on 19.12.2022.
//

import SwiftUI

struct TextFieldVIew: View {

    @Binding var value: Double
    @Binding var text: String
    let color: Color
    
    @State var alertPresented: Bool = false
    
    var body: some View {
        VStack {
            TextField("", text: $text) { _ in
                withAnimation {
                    showAlert()
                }
            }
            .alert("Внимание", isPresented: $alertPresented, actions: {}, message: {
                Text("Введите число в диапозоне 0...255")
            })
                .keyboardType(.numberPad)
                .textFieldStyle(.roundedBorder)
                .frame(width: 50, height: 30)
                .multilineTextAlignment(.center)
                .foregroundColor(color)
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(color, lineWidth: 2)
                }
                .onChange(of: value) { newValue in
                    text = value.formatted()
                }
        }
        .onAppear {
            text = value.formatted()
        }
    }
}

struct TextFieldVIew_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldVIew(value: .constant(123), text: .constant("123"), color: .red)
    }
}

extension TextFieldVIew {
    private func showAlert() {
        if let valueTF = Int(text), (0...255).contains(valueTF) {
            value = Double(valueTF)
        } else {
            alertPresented.toggle()
            value = 0
        }
    }
}
