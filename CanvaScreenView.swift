//
//  CanvaScreenView.swift
//  WWDC2024
//
//  Created by Julia Elice Jurczyszyn on 04/02/24.
//

import SwiftUI
import PencilKit

struct CanvaScreenView: View {
    
    @State private var selectedColor = Color.black
    @State var canvas = PKCanvasView()
    @State var isDraw = true
    @State private var isTextHidden = false
    @State private var isLineHidden = false
    @State var ink = PKInkingTool(.pen, color: .black, width: CGFloat(4))
    
    var body: some View {
        VStack {
            HStack (alignment: .top) {
                Button(action: {
                    isDraw.toggle()
                }, label: {
                    Image(systemName: self.isDraw == true ? "eraser" : "applepencil.tip")
                        .font(.system(size: 32, weight: .bold))
                        .foregroundColor(.gray)
                        .padding()
                        .frame(width: 70, height: 70)
                        .background(.white)
                        .cornerRadius(40)
                        .shadow(radius: 10)
                }) /// Eraser button
                
                ColorPalette(selectedColor: $selectedColor)
                    .frame(width: 500, height: 70)
                    .background(.white)
                    .cornerRadius(40)
                    .shadow(radius: 10)
                                

                Button(action: {
                    isTextHidden.toggle()
                }, label: {
                    Image(systemName: "textformat.alt")
                        .font(.system(size: 32, weight: .bold))
                        .foregroundColor(.gray)
                        .opacity(self.isTextHidden == false ? 1 : 0.2)
                        .padding()
                        .frame(width: 70, height: 70)
                        .background(.white)
                        .cornerRadius(40)
                        .shadow(radius: 10)
                        
                }) /// Hide Tip Text buttom
                
                Button(action: {
                    isLineHidden.toggle()
                }, label: {
                    Image(systemName: "text.justify")
                        .font(.system(size: 32, weight: .bold))
                        .foregroundColor(.gray)
                        .opacity(self.isLineHidden == false ? 1 : 0.2)
                        .padding()
                        .frame(width: 70, height: 70)
                        .background(.white)
                        .cornerRadius(40)
                        .shadow(radius: 10)
                }) /// Hide Line Guide buttom
                
                
            } /// Hstack
            .padding(.horizontal, 32)
            .padding(.top, 16)
            .padding(.bottom, 8)
            
            
            ZStack {
                VStack (alignment: .center){
                    Text("Teus olhos são meus livros. \n Que livro há aí melhor, \n em que melhor se leia \n a página do amor?")
                        .font(.memimaSmall)
                        .multilineTextAlignment(.center)
                    
                    Spacer()
                    
                    VStack (spacing: 40) {
                        ForEach(["Teus olhos são meus livros.", "Que livro há aí melhor,", "em que melhor se leia", "a página do amor?"], id: \.self) { line in
                            Text(line)
                                .font(.memimaBig)
                                .multilineTextAlignment(.center)
                                .opacity(isTextHidden ? 0 : 0.2)
                                .frame(maxWidth: .infinity)
                                .overlay(ZStack{
                                    Divider().offset(y: 15)
                                    Divider().offset(x: 0, y: 50)
                                    Divider().offset(x: 0, y: -9)
                                    Divider().offset(x: 0, y: -40)
                                } .opacity(isLineHidden ? 0 : 1))
                        } /// ForEach
                    } /// Third VStack
                    
                    Spacer()
                    Spacer()
                    
                } /// Second Vstack
                .padding(.top, 64)
                
                WritingCanva(canvas: $canvas, isDraw: $isDraw, ink: $ink)
                
            } /// ZStack
            
            Button(action: {
                
            }, label: {
                Text("Finish")
                    .font(.system(size: 32, weight: .bold))
                    .foregroundColor(.gray)
                    .padding()
                    .frame(width: 200, height: 70)
                    .background(.white)
                    .cornerRadius(40)
                    .shadow(radius: 10)
                    .padding(.bottom, 32)
            })
        } /// VStack
        .onChange(of: selectedColor) { newValue in
            ink.color = UIColor(newValue)
        } /// onChange
    }
}

#Preview {
    CanvaScreenView()
}
