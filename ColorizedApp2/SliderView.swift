//
//  SliderView.swift
//  ColorizedApp2
//
//  Created by Иса on 19.12.2022.
//

import SwiftUI
import Combine

struct SliderView: View {
    
    @Binding var value: Double
    @State var text: String = ""
    let color: Color
        
    var body: some View {
        HStack {
            TextView(text: text, color: color)
            Slider(value: $value, in: 0...255, step: 1)
                .tint(color)
                .onChange(of: value) { newValue in
                    text = value.formatted()
                }
            TextFieldVIew(value: $value, text: $text, color: color)
        }
        .onAppear {
            value = Double(lround(value))
            text = value.formatted()
        }
    }
}

struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        SliderView(value: .constant(123), color: .green)
    }
}
