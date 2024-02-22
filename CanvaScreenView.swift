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
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var showingPopover = true
    @State private var selectedColor = Color.black
    @State var canvas = PKCanvasView()
    @State var isDraw = true
    @State private var isTextHidden = false
    @State private var isLineHidden = false
    @State var ink = PKInkingTool(.pen, color: .black, width: CGFloat(4))
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.white)
                    .ignoresSafeArea()
                VStack {
                    HStack (alignment: .top) {
                        
                        Button {
                            presentationMode.wrappedValue.dismiss()
                        } label: {
                            Image(systemName: "chevron.left")
                                .font(.system(size: 24, weight: .bold))
                                .foregroundColor(.gray)
                                .padding()
                                .frame(width: 45, height: 45)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 40)
                                        .stroke(Color("lightBlue"), lineWidth: 6))
                                .background(.white)
                                .cornerRadius(40)
                        } /// back to the main screen
                        
                        Button(action: {
                            isDraw.toggle()
                        }, label: {
                            Image(systemName: self.isDraw == true ? "eraser" : "applepencil.tip")
                                .font(.system(size: 24, weight: .bold))
                                .foregroundColor(.gray)
                                .padding()
                                .frame(width: 45, height: 45)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 40)
                                        .stroke(Color("lightBlue"), lineWidth: 6))
                                .background(.white)
                                .cornerRadius(40)
                        }) /// Eraser button
                        
                        ColorPalette(selectedColor: $selectedColor)
                            .frame(width: 300, height: 45)
                            .overlay(
                                RoundedRectangle(cornerRadius: 40)
                                    .stroke(Color("lightBlue"), lineWidth: 6))
                            .background(.white)
                            .cornerRadius(40)
                        
                        
                        Button(action: {
                            isTextHidden.toggle()
                        }, label: {
                            Image(systemName: "textformat.alt")
                                .font(.system(size: 24, weight: .bold))
                                .foregroundColor(.gray)
                                .opacity(self.isTextHidden == false ? 1 : 0.2)
                                .padding()
                                .frame(width: 45, height: 45)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 40)
                                        .stroke(Color("lightBlue"), lineWidth: 6))
                                .background(.white)
                                .cornerRadius(40)
                        }) /// Hide Tip Text buttom
                        
                        
                        
                        Button(action: {
                            isLineHidden.toggle()
                        }, label: {
                            Image(systemName: "text.justify")
                                .font(.system(size: 24, weight: .bold))
                                .foregroundColor(.gray)
                                .opacity(self.isLineHidden == false ? 1 : 0.2)
                                .padding()
                                .frame(width: 45, height: 45)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 40)
                                        .stroke(Color("lightBlue"), lineWidth: 6))
                                .background(.white)
                                .cornerRadius(40)
                        }) /// Hide Line Guide buttom
                    } /// Hstack
                    .padding(.horizontal, 32)
                    .padding(.top, 16)
                    .padding(.bottom, 8)
                    
                    
                    ZStack {
                        VStack (alignment: .center){
                            
                            HStack {
                                VStack (alignment: .trailing, spacing: 10) {
                                    ForEach(poem.poem, id: \.self) { line in
                                        Text(line)
                                            .font(.memimaSmall)
                                            .foregroundColor(Color("black"))
                                    }
                                }
                                .padding(.horizontal, 24)
                                
                                VStack (alignment: .leading, spacing: 32) {
                                    ForEach(poem.translation, id: \.self) { line in
                                        Text(line)
                                            .font(.system(size: 12, design: .rounded))
                                            .foregroundColor(.gray)
                                    }
                                }
                            }
                            .frame(height: 200)
                            
                            Spacer()
                            
                            VStack (spacing: 40) {
                                ForEach(poem.poem, id: \.self) { line in
                                    Text(line)
                                        .font(.memimaBig)
                                        .foregroundColor(.black)
                                        .multilineTextAlignment(.center)
                                        .opacity(isTextHidden ? 0 : 0.2)
                                        .frame(maxWidth: .infinity)
                                        .overlay(ZStack{
                                            Divider().offset(y: 15)
                                            Divider().offset(x: 0, y: 43)
                                            Divider().offset(x: 0, y: -7)
                                            Divider().offset(x: 0, y: -34)
                                        } .opacity(isLineHidden ? 0 : 1))
                                } /// ForEach
                            } /// Third VStack
                            
                            Spacer()
                            Spacer()
                            
                        } /// Second Vstack
                        .padding(.top, 64)
                        
                        WritingCanva(canvas: $canvas, isDraw: $isDraw, ink: $ink)
                        
                    } /// ZStack
                    
                    NavigationLink {
                        ResultScreenView(canvas: canvas)
                    } label: {
                        Text("See your result")
                            .font(.system(size: 24, design: .rounded)).bold()
                            .foregroundColor(Color("darkBlue"))
                            .padding()
                            .frame(width: 220, height: 45)
                            .overlay(
                                RoundedRectangle(cornerRadius: 40)
                                    .stroke(Color("lightBlue"), lineWidth: 10))
                            .background(Color("lightBlue"))
                            .cornerRadius(40)
                            .padding(.bottom, 32)
                    }
                } /// VStack
                .onChange(of: selectedColor) { newValue in
                    ink.color = UIColor(newValue)
                } /// onChange
                
                .popover(isPresented: $showingPopover,  content: {
                        VStack {
                            Text("Use the Apple Pencil to write")
                                .font(.system(size: 24, design: .rounded)).bold()
                                .foregroundColor(Color("darkBlue"))
                                .padding(32)
                        }
                    }) /// popOver
            } /// zstack
        } /// navigation stack
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    CanvaScreenView(poem: PoemOption(title: "When she speaks", source: "Falenas, 1870", illustration: "brazilianSky", poem: ["Quando ela fala, parece", "Que a voz da brisa se cala;", "Talvez um anjo emudece", "Quando ela fala."], translation: ["When she speaks, it seems", "That the voice of the breeze is silent;", "Perhaps an angel becomes silent", "when she speaks."]))
}
