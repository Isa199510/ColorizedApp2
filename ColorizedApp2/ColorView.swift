//
//  ColorView.swift
//  ColorizedApp2
//
//  Created by Иса on 19.12.2022.
//

import SwiftUI

struct ColorView: View {
    let red: Double
    let green: Double
    let blue: Double
    
    var body: some View {
        Rectangle()
            .fill(Color(red: red/255, green: green/255, blue: blue/255))
            .frame(width: 250, height: 150)
            .cornerRadius(10)
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.green, lineWidth: 3)
            }
    }
}

struct ColorView_Previews: PreviewProvider {
    static var previews: some View {
        ColorView(red: 10, green: 30, blue: 0)
    }
}
