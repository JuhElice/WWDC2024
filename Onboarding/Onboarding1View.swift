//
//  Onboarding1View.swift
//  WWDC2024
//
//  Created by Julia Elice Jurczyszyn on 16/02/24.
//

import SwiftUI

struct Onboarding1View: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color("green")
                    .ignoresSafeArea()
                
                Text("Cursive writing is taught to children in Brazil, who practice with handwriting books to improve their skills.")
                    .font(.system(size: 24, design: .rounded))
            }
        }
    }
}

#Preview {
    Onboarding1View()
}
