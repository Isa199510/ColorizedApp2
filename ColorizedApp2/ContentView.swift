//
//  ContentView.swift
//  ColorizedApp2
//
//  Created by Иса on 18.12.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State var red = Double.random(in: 0...255)
    @State var green = Double.random(in: 0...255)
    @State var blue = Double.random(in: 0...255)
    
    @FocusState private var focusedField: Field?
    
    var body: some View {
        VStack {
            
            ColorView(red: red, green: green, blue: blue)
            
            SliderView(value: $red, color: .red)
                .focused($focusedField, equals: .red)
            SliderView(value: $green, color: .green)
                .focused($focusedField, equals: .green)
            SliderView(value: $blue, color: .blue)
                .focused($focusedField, equals: .blue)
            Spacer()
        }
        .toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                Button(action: prevField) {
                    Image(systemName: "chevron.up")
                }
                
                Button(action: nextField) {
                    Image(systemName: "chevron.down")
                }
                
                Spacer()
                
                Button("Done") {
                    focusedField = nil
                }
            }
        }
        .padding()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension ContentView {
    private enum Field {
        case red, green, blue
    }
    
    private func prevField() {
        switch focusedField {
        case .red:
            focusedField = .blue
        case .green:
            focusedField = .red
        case .blue:
            focusedField = .green
        case .none:
            focusedField = nil
        }
    }
    
    private func nextField() {
        switch focusedField {
        case .red:
            focusedField = .green
        case .green:
            focusedField =  .blue
        case .blue:
            focusedField = .red
        case .none:
            focusedField = nil
        }
    }
}
