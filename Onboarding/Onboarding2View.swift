//
//  Onboarding2View.swift
//  WWDC2024
//
//  Created by Julia Elice Jurczyszyn on 16/02/24.
//

import SwiftUI

struct Onboarding2View: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color("yellow")
                    .ignoresSafeArea()
                
                Text("However, some children have greater difficulty developing their fine motor coordination, which is essential for legible writing.")
                    .font(.system(size: 24, design: .rounded))
            }
        }
    }
}

#Preview {
    Onboarding2View()
}
