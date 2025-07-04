//
//  ZoomView.swift
//  Challenge06
//
//  Created by Daniel Leal PImenta on 04/07/25.
//

import SwiftUI

struct ZoomView: View {
    
    let image: Image?
    
    @Binding var isPresented: Bool
    
    // Zoom
    @State private var currentScale: CGFloat = 1.0
    @State private var finalScale: CGFloat = 1.0
    
    // Drag
    @State private var currentOffset: CGSize = .zero
    @State private var finalOffset: CGSize = .zero
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.5)
                .edgesIgnoringSafeArea(.all)
                .onTapGesture {
                    if finalScale <= 1.05 {
                        isPresented = false
                    }
                }
            
            GeometryReader { geometry in
                if let image = image {
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .scaleEffect(currentScale)
                        .offset(currentOffset)
                        .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
                        .gesture(
                            dragGesture(geometry: geometry)
                                .simultaneously(with: magnificationGesture(geometry: geometry))
                        )
                        .onTapGesture {
                            resetState()
                        }
                }
                
            }
        }
    }
    private func magnificationGesture(geometry: GeometryProxy) -> some Gesture {
        MagnificationGesture()
            .onChanged { value in
                currentScale = finalScale * value
            }
            .onEnded { value in
                finalScale = max(1.0, currentScale)
                currentScale = finalScale
                if currentScale <= 1.0 {
                    resetState()
                } else {
                    adjustOffset(geometry: geometry)
                    finalOffset = currentOffset
                }
            }
    }
    
    private func dragGesture(geometry: GeometryProxy) -> some Gesture {
        DragGesture()
            .onChanged { value in
                if currentScale > 1.0 {
                    self.currentOffset = CGSize(
                        width: value.translation.width + finalOffset.width,
                        height: value.translation.height + finalOffset.height
                    )
                }
            }
            .onEnded { value in
                if currentScale > 1.0 {
                    adjustOffset(geometry: geometry)
                    self.finalOffset = self.currentOffset
                }
            }
    }

    private func resetState() {
        withAnimation(.spring()) {
            currentScale = 1.0
            finalScale = 1.0
            currentOffset = .zero
            finalOffset = .zero
        }
    }
    
    private func adjustOffset(geometry: GeometryProxy) {
        let imageSize = geometry.size
        let scaledImageSize = CGSize(width: imageSize.width * currentScale, height: imageSize.height * currentScale)
        
        let maxOffsetX = (scaledImageSize.width - imageSize.width) / 2
        let maxOffsetY = (scaledImageSize.height - imageSize.height) / 2
        
        var newOffsetX = currentOffset.width
        var newOffsetY = currentOffset.height
        
        if abs(newOffsetX) > maxOffsetX {
            newOffsetX = maxOffsetX * (newOffsetX > 0 ? 1 : -1)
        }
        
        if abs(newOffsetY) > maxOffsetY {
            newOffsetY = maxOffsetY * (newOffsetY > 0 ? 1 : -1)
        }
        withAnimation(.easeOut) {
            currentOffset = CGSize(width: newOffsetX, height: newOffsetY)
        }
    }
}
