//
//  Onboarding3View.swift
//  WWDC2024
//
//  Created by Julia Elice Jurczyszyn on 16/02/24.
//

import SwiftUI

struct Onboarding3View: View {
    
    @State var animate = false
    
    var body: some View {
        NavigationStack {
            VStack {
                ZStack {
                    Rectangle()
                        .frame(width: 500, height: 500)
                        .foregroundColor(Color("lightBlue"))
                        .cornerRadius(40)
                        .offset(y: -100)
                    
                    Image("pencil1")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 600)
                        .offset(y: 100)
                    
                    
                    Image(animate ? "bird1" : "bird2")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 600)
                        .offset(y: 100)
                }
                .task {
                    withAnimation(.default .repeatForever(autoreverses: true).speed(0.3)) {
                        animate = true
                        
                    }
                }
                
                Text("Aligned with this, Introducing poetry to children opens doors to the world of literature and emotions.")
                    .font(.system(size: 32, design: .rounded)).bold()
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color("darkBlue"))
                    .padding(.horizontal, 32)
                
                HStack {
                    NavigationLink {
                        Onboarding2View()
                    } label: {
                        Text("\(Image(systemName: "chevron.left"))   Previous")
                            .font(.system(size: 24, design: .rounded)).bold()
                            .foregroundColor(Color("darkBlue"))
                            .frame(width: 300, height: 70)
                            .overlay(
                                RoundedRectangle(cornerRadius: 40)
                                    .stroke(Color("lightBlue"), lineWidth: 10))
                            .background(.white)
                            .cornerRadius(40)
                    }
                    
                    
                    NavigationLink {
                        Onboarding4View()
                    } label: {
                        Text("Next   \(Image(systemName: "chevron.right"))")
                            .font(.system(size: 24, design: .rounded)).bold()
                            .foregroundColor(Color("darkBlue"))
                            .frame(width: 300, height: 70)
                            .overlay(
                                RoundedRectangle(cornerRadius: 40)
                                    .stroke(Color("lightBlue"), lineWidth: 10))
                            .background(Color("lightBlue"))
                            .cornerRadius(40)
                    }
                } /// HStack Botton buttons
                .padding(.vertical, 32)
            } /// VStack
        } /// Navigation stack
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    Onboarding3View()
}
