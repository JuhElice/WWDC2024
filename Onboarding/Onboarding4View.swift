//
//  Onboarding4View.swift
//  WWDC2024
//
//  Created by Julia Elice Jurczyszyn on 16/02/24.
//

import SwiftUI

struct Onboarding4View: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color("orange")
                    .ignoresSafeArea()
                
                Text("In this way, poetic pen combines learning to write with poems by one of the most famous Brazilian writers, Machado de Assis, to inspire children to learn culture by practicing writing.")
                    .font(.system(size: 24, design: .rounded))
            }
        }
    }
}

#Preview {
    Onboarding4View()
}
