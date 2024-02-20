//
//  ResultScreenView.swift
//  WWDC2024
//
//  Created by Julia Elice Jurczyszyn on 19/02/24.
//

import SwiftUI
import PencilKit

struct ResultScreenView: View {
    
    let canvas: PKCanvasView
    @Environment (\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("This is your result!").bold()
                    .font(.system(size: 52, design: .rounded))
                    .foregroundColor(Color("darkBlue"))
                    .padding(.top, 48)
                
                VStack {
                ShowingCanva(canvas: canvas)
                
                    HStack {
                        Button {
                            presentationMode.wrappedValue.dismiss()
                        } label: {
                            Text("Write this poem again")
                                .font(.system(size: 32, weight: .bold))
                                .foregroundColor(Color("darkBlue"))
                                .padding()
                                .frame(width: 400, height: 70)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 40)
                                        .stroke(Color("lightBlue"), lineWidth: 10))
                                .background(.white)
                                .cornerRadius(40)
                                
                        }
                        
                        NavigationLink {
                            MainScreenView()
                        } label: {
                            Text("Practice another poem")
                                .font(.system(size: 32, weight: .bold))
                                .foregroundColor(Color("darkBlue"))
                                .padding()
                                .frame(width: 400, height: 70)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 40)
                                        .stroke(Color("lightBlue"), lineWidth: 10))
                                .background(Color("lightBlue"))
                                .cornerRadius(40)
                               
                        }
                    }
                }
                .padding(.bottom, 48)
                .background(.white)
                .clipShape(
                    .rect(
                        topLeadingRadius: 72,
                        topTrailingRadius: 72
                    ))
                .ignoresSafeArea()
            }
            .background(Color("lightBlue"))
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    ResultScreenView(canvas: PKCanvasView())
}
