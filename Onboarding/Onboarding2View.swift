//
//  Onboarding2View.swift
//  WWDC2024
//
//  Created by Julia Elice Jurczyszyn on 16/02/24.
//

import SwiftUI

struct Onboarding2View: View {
    
    @State var scale = false
    @State var moveUp = false
    
    var body: some View {
        NavigationStack {
            VStack {
                ZStack {
                    Rectangle()
                        .frame(width: 500, height: 500)
                        .foregroundColor(Color("lightBlue"))
                        .cornerRadius(40)
                        .offset(y: -100)
                    
                    Image("shadowBook2")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 600)
                        .offset(y: 100)
                        .scaleEffect(x: scale ? 0.8 : 1, y: scale ? 0.8 : 1)
                    
                    Image("book2")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 600)
                        .offset(y: moveUp ? 50 : 100)
                }
                .task {
                    withAnimation(.easeInOut.repeatForever(autoreverses: true).speed(0.3)) {
                        moveUp = true
                        scale = true
                    }
                }
                
                Text("However, some children have greater difficulty developing their fine motor coordination, which is essential for legible writing.")
                    .font(.system(size: 32, design: .rounded)).bold()
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color("darkBlue"))
                    .padding(.horizontal, 32)
                
                HStack {
                    NavigationLink {
                        Onboarding1View()
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
                        Onboarding3View()
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
    Onboarding2View()
}
