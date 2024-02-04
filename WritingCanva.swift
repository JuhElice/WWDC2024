//
//  WritingView.swift
//  WWDC2024
//
//  Created by Julia Elice Jurczyszyn on 02/02/24.
//

import SwiftUI
import PencilKit

struct WritingCanva: UIViewRepresentable {
    
    let ink = PKInkingTool(.pen, color: .black)
    let eraser = PKEraserTool(.bitmap)
    
    @Binding var canvas: PKCanvasView
    @Binding var isDraw: Bool
    
    
    func makeUIView(context: Context) -> PKCanvasView {
        canvas.backgroundColor = .clear
        canvas.isOpaque = false
        canvas.drawingPolicy = .anyInput
        canvas.tool = isDraw ? ink: eraser
        return canvas
    }
    
    func updateUIView(_ uiView: PKCanvasView, context: Context) {
        uiView.tool = isDraw ? ink: eraser
    }
} 

//#Preview {
//    WritingCanva(canvas: Canvas, isDraw: false)
//}


