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
            Color(.orange)
                
            VStack (alignment: .leading) {
                Image(systemName: poem.icon)
                Text("aaaa")
                    .font(.borelSmall)
                
            }
            .frame(maxWidth: .infinity)
            .background(.white)
        }
        .cornerRadius(32)
    }
}

#Preview {
    PoemOptionsView(poem: PoemOption(title: "...", author: "...", icon: "star", preview: "..."))
    
}
