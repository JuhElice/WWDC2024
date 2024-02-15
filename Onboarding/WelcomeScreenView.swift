//
//  WelcomeScreenView.swift
//  WWDC2024
//
//  Created by Julia Elice Jurczyszyn on 15/02/24.
//

import SwiftUI

struct WelcomeScreenView: View {
    var body: some View {
        ZStack {
            Color("green")
            Circle()
                .foregroundColor(.white)
                .opacity(0.5)
                .frame(width: 600)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    WelcomeScreenView()
}
