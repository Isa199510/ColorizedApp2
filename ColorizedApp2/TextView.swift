//
//  TextView.swift
//  ColorizedApp2
//
//  Created by Иса on 18.12.2022.
//

import SwiftUI

struct TextView: View {
    
    let text: String
    let color: Color
    
    var body: some View {
        VStack {
            Text(text)
                .frame(width: 50, height: 30)
                .foregroundColor(color)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(color, lineWidth: 1)
                )
        }
    }
}

struct TextView_Previews: PreviewProvider {
    static var previews: some View {
        TextView(text: "123", color: .red)
    }
}
