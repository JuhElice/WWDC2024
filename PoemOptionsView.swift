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
        VStack (alignment: .leading) {
            Image(systemName: poem.icon)
            Text("aaaa")
                .font(.borelPequena)
                
            
        }
    }
}

#Preview {
    PoemOptionsView(poem: PoemOption(title: "...", author: "...", icon: "star", preview: "..."))
    
}
