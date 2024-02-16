//
//  Onboarding3View.swift
//  WWDC2024
//
//  Created by Julia Elice Jurczyszyn on 16/02/24.
//

import SwiftUI

struct Onboarding3View: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color("blue")
                    .ignoresSafeArea()
                
                Text("Aligned with this, Introducing poetry to children opens doors to the world of literature and emotions.")
                    .font(.system(size: 24, design: .rounded))
            }
        }
    }
}

#Preview {
    Onboarding3View()
}
