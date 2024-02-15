//
//  CanvaScreenView.swift
//  WWDC2024
//
//  Created by Julia Elice Jurczyszyn on 04/02/24.
//

import SwiftUI
import PencilKit

struct CanvaScreenView: View {
    
    let poem: PoemOption
    
    @State private var selectedColor = Color.black
    @State var canvas = PKCanvasView()
    @State var isDraw = true
    @State private var isTextHidden = false
    @State private var isLineHidden = false
    @State private var isTranslated = false
    @State var ink = PKInkingTool(.pen, color: .black, width: CGFloat(4))
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack (alignment: .top) {
                    
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 32, weight: .bold))
                            .foregroundColor(.gray)
                            .padding()
                            .frame(width: 60, height: 60)
                            .overlay(
                                RoundedRectangle(cornerRadius: 40)
                                    .stroke(Color("lightBlue"), lineWidth: 10))
                            .background(.white)
                            .cornerRadius(40)
//                            .shadow(radius: 10)
                    })
                    
                    Button(action: {
                        isDraw.toggle()
                    }, label: {
                        Image(systemName: self.isDraw == true ? "eraser" : "applepencil.tip")
                            .font(.system(size: 32, weight: .bold))
                            .foregroundColor(.gray)
                            .padding()
                            .frame(width: 60, height: 60)
                            .overlay(
                                RoundedRectangle(cornerRadius: 40)
                                    .stroke(Color("lightBlue"), lineWidth: 10))
                            .background(.white)
                            .cornerRadius(40)
//                            .shadow(radius: 10)
                    }) /// Eraser button
                    
                    ColorPalette(selectedColor: $selectedColor)
                        .frame(width: 390, height: 60)
                        .overlay(
                            RoundedRectangle(cornerRadius: 40)
                                .stroke(Color("lightBlue"), lineWidth: 10))
                        .background(.white)
                        .cornerRadius(40)
//                        .shadow(radius: 10)
                    
                    
                    Button(action: {
                        isTextHidden.toggle()
                    }, label: {
                        Image(systemName: "textformat.alt")
                            .font(.system(size: 32, weight: .bold))
                            .foregroundColor(.gray)
                            .opacity(self.isTextHidden == false ? 1 : 0.2)
                            .padding()
                            .frame(width: 60, height: 60)
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
                            .frame(width: 60, height: 60)
                            .background(.white)
                            .cornerRadius(40)
                            .shadow(radius: 10)
                    }) /// Hide Line Guide buttom
                    
                    
                    Button(action: {
                        isTranslated.toggle()
                    }, label: {
                        Image(systemName: "globe")
                            .font(.system(size: 32, weight: .bold))
                            .foregroundColor(.gray)
                            .opacity(self.isTranslated == false ? 1 : 0.2)
                            .padding()
                            .frame(width: 60, height: 60)
                            .background(.white)
                            .cornerRadius(40)
                            .shadow(radius: 10)
                    })
                } /// Hstack
                .padding(.horizontal, 32)
                .padding(.top, 16)
                .padding(.bottom, 8)
                
                
                ZStack {
                    VStack (alignment: .center){
                        
                        VStack (spacing: 10) {
                            ForEach(isTranslated ? poem.translation : poem.poem, id: \.self) { line in
                                Text(line)
                                    .font(isTranslated ? .system(size: 24, design: .rounded) : .memimaSmall)
                                    .foregroundColor(isTranslated ? .gray : Color("black"))
                                    .multilineTextAlignment(.center)
                            }
                        }
                        .frame(height: 200)
                        
                        Spacer()
                        
                        VStack (spacing: 40) {
                            ForEach(poem.poem, id: \.self) { line in
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
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    CanvaScreenView(poem: PoemOption(title: "When she speaks", source: "Falenas, 1870", illustration: "brazilianSky", poem: ["Quando ela fala, parece", "Que a voz da brisa se cala;", "Talvez um anjo emudece", "Quando ela fala."], translation: ["When she speaks, it seems", "That the voice of the breeze is silent;", "Perhaps an angel becomes silent", "when she speaks."]))
}
