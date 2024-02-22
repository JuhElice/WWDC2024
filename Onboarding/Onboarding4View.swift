//
//  Onboarding4View.swift
//  WWDC2024
//
//  Created by Julia Elice Jurczyszyn on 16/02/24.
//

import SwiftUI

struct Onboarding4View: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State var scale = false
    @State var moveUp = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.white)
                    .ignoresSafeArea()
                VStack {
                    Spacer()
                    ZStack {
                        Rectangle()
                            .frame(width: 500, height: 500)
                            .foregroundColor(Color("purple"))
                            .cornerRadius(40)
                            .offset(y: -50)
                        
                        Image("shadowBook3")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 600)
                            .offset(y: 100)
                            .scaleEffect(x: scale ? 0.8 : 1, y: scale ? 0.8 : 1)
                        
                        Image("book3")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 600)
                            .offset(y: moveUp ? 80 : 100)
                    }
                    .task {
                        withAnimation(.easeInOut.repeatForever(autoreverses: true).speed(0.3)) {
                            moveUp = true
                            scale = true
                        }
                    }
                    
                    Text("In this way, Poetic Pen combines learning to write with poems by one of the most famous Brazilian writer, Machado de Assis, to inspire children to learn culture by practicing writing the portuguese language.")
                        .font(.system(size: 32, design: .rounded)).bold()
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color("darkBlue"))
                        .padding(.horizontal, 32)
                    
                    HStack {
                        Button {
                            presentationMode.wrappedValue.dismiss()
                        } label: {
                            Text("\(Image(systemName: "chevron.left"))   Previous")
                                .font(.system(size: 24, design: .rounded))
                                .foregroundColor(Color("darkBlue"))
                                .frame(width: 200, height: 60)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 40)
                                        .stroke(Color("lightBlue"), lineWidth: 6))
                                .background(.white)
                                .cornerRadius(40)
                        }
                        
                        
                        NavigationLink {
                            MainScreenView()
                        } label: {
                            Text("Start practicing   \(Image(systemName: "chevron.right"))")
                                .font(.system(size: 24, design: .rounded)).bold()
                                .foregroundColor(Color("darkBlue"))
                                .frame(width: 280, height: 60)
                                .background(Color("lightBlue"))
                                .cornerRadius(40)
                        }
                    } /// HStack Botton buttons
                    .padding(.top, 32)
                } /// VStack
                .padding(.vertical, 80)
            } /// zstack
        }/// Navigation stack
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    Onboarding4View()
}
