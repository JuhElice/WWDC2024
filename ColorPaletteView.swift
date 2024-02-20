//
//  ColorPaletteView.swift
//  WWDC2024
//
//  Created by Julia Elice Jurczyszyn on 05/02/24.
//

import SwiftUI

struct ColorPalette: View {
    
    @Binding var selectedColor: Color
    let colors: [Color] = [Color("black"), Color("orange"), Color("yellow"), Color("green"), Color("blue"), Color("purple"), Color("red")]
    
    var body: some View {
        
        HStack(spacing: 12) {
            ForEach(colors, id: \.self) { color in
                Button(action: {
                    self.selectedColor = color
                }) {
                    Circle()
                        .fill(color)
                        .frame(width: 40, height: 40)
                        .overlay(
                            Circle()
                                .stroke(Color.black, lineWidth: self.selectedColor == color ? 3 : 0))
                }
            } /// forEach
        } /// HStack
    }
}

#Preview {
    ColorPalette(selectedColor: .constant(.black))
}
