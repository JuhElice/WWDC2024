//
//  WritingView.swift
//  WWDC2024
//
//  Created by Julia Elice Jurczyszyn on 02/02/24.
//

import SwiftUI
import PencilKit

struct ShowingCanva: UIViewRepresentable {
    var canvas: PKCanvasView
    
    
    func makeUIView(context: Context) -> PKCanvasView {
        canvas.backgroundColor = .clear
        canvas.isOpaque = false
        canvas.drawingPolicy = .anyInput
        canvas.drawingGestureRecognizer.isEnabled = false
        
        return canvas
    }
    
    func updateUIView(_ uiView: PKCanvasView, context: Context) {
    }
} /// struct


