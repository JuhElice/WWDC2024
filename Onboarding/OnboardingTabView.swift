//
//  OnboardingTabView.swift
//  WWDC2024
//
//  Created by Julia Elice Jurczyszyn on 15/02/24.
//

import SwiftUI


struct OnboardingTabView: View {
    var body: some View {
        ZStack {
            Color("beige")
                .ignoresSafeArea()
            
            TabView {
                Onboarding1View()
                Onboarding2View()
                Onboarding3View()
                Onboarding4View()
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .ignoresSafeArea()
        .edgesIgnoringSafeArea(.all)
    }
}


#Preview {
    OnboardingTabView()
}
