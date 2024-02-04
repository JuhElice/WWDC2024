//
//  CanvaScreenView.swift
//  WWDC2024
//
//  Created by Julia Elice Jurczyszyn on 04/02/24.
//

import SwiftUI
import PencilKit

struct CanvaScreenView: View {
    
    @State var canvas = PKCanvasView()
    @State var isDraw = true
    @State var penColor = Color.black
    @State private var isHidden = false
    
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
                
                ColorPicker("", selection: $penColor)
                    .labelsHidden()
                    .frame(width: 70, height: 70)
                    .background(.white)
                    .cornerRadius(40)
                    .shadow(radius: 10)
                
                
                Button(action: {
                    isHidden.toggle()
                }, label: {
                    Image(systemName: "textformat.alt")
                        .font(.system(size: 32, weight: .bold))
                        .foregroundColor(.gray)
                        .opacity(self.isHidden == false ? 1 : 0.2)
                        .padding()
                        .frame(width: 70, height: 70)
                        .background(.white)
                        .cornerRadius(40)
                        .shadow(radius: 10)
                        
                }) /// Hide Tip Text buttom
                
                Button(action: {
                    
                }, label: {
                    Image(systemName: "text.justify")
                        .font(.system(size: 32, weight: .bold))
                        .foregroundColor(.gray)
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
                    Text("teus olhos são meus livros \n que livro há aí melhor \n em que melhor se leia \n a página do amor?")
                        .font(.borelPequena)
                        .multilineTextAlignment(.center)
                    
                    Spacer()
                    
                    Text("teus olhos são meus livros \n que livro há aí melhor \n em que melhor se leia \n a página do amor?")
                        .font(.borelGrande)
                        .multilineTextAlignment(.center)
                        .opacity(isHidden ? 0 : 0.1)
                
                    
                    Spacer()
                    Spacer()
                    
                } /// Second Vstack
                .padding(.top, 64)
                
                WritingCanva(canvas: $canvas, isDraw: $isDraw)
                
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
    }
}

#Preview {
    CanvaScreenView()
}
