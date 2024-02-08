//
//  PoemOptionsView.swift
//  WWDC2024
//
//  Created by Julia Elice Jurczyszyn on 31/01/24.
//

import SwiftUI

struct PoemOptionsView: View {
    
    let poem: PoemOption
    
    var body: some View {
        ZStack {
            Image(poem.illustration)
                .resizable()
                .scaledToFill()
                
            VStack {
                Spacer()
                VStack (alignment: .leading) {
                    Text(poem.title)
                        .font(.system(size: 24, design: .rounded))
                        .foregroundColor(Color("black"))
                    
                    Text(poem.source)
                        .font(.system(size: 16, design: .rounded))
                        .foregroundColor(Color("black"))
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(.white)
                .opacity(0.9)
                .cornerRadius(16)
                .padding(16)
            }
        }
        .cornerRadius(32)
        .padding(8)
    }
}

#Preview {
    PoemOptionsView(poem: PoemOption(title: "When she speaks", source: "Falenas, 1870", illustration: "brazilianSky", poem: ["Quando ela fala, parece", "Que a voz da brisa se cala;", "Talvez um anjo emudece", "Quando ela fala."], translation: ["When she speaks, it seems", "That the voice of the breeze is silent;", "Perhaps an angel becomes silent", "when she speaks."]))
    
}
