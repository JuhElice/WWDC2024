//
//  WelcomeScreenView.swift
//  WWDC2024
//
//  Created by Julia Elice Jurczyszyn on 15/02/24.
//

import SwiftUI

struct WelcomeScreenView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color("lightBlue")
                    .ignoresSafeArea()
                
                VStack {
                    Spacer()
                    Image("poeticPen")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 500)
                        .offset(x: 40)
                    
                    Spacer()
                    
                    NavigationLink {
                        Onboarding1View()
                    } label: {
                        Text("Start")
                            .font(.system(size: 32, design: .rounded)).bold()
                            .foregroundColor(.white)
                            .frame(width: 280, height: 70)
                            .background(Color("darkBlue"))
                            .cornerRadius(40)
                    }
                    Spacer()
                }
            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    WelcomeScreenView()
}
