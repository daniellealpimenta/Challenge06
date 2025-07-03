//
//  ApiCardView.swift
//  Challenge06
//
//  Created by Daniel Leal PImenta on 30/06/25.
//

import SwiftUI

struct ApiCardView: View {
    
    let game: ApiModel
    let isSelected: Bool
    
    var body: some View {
        VStack(spacing: 10) {
            AsyncImage(url: URL(string: game.background_image)) { image in
                image
                    .image?
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 200, height: 120)
                    .clipShape(RoundedRectangle(cornerRadius: 25))
            }
            Text(game.name)
                .font(.caption)
        }
        .padding(8)
        .background(
            isSelected ? Color.green.opacity(0.3) : Color.clear
        )
        .cornerRadius(30)
        .overlay(
            RoundedRectangle(cornerRadius: 30)
                .stroke(isSelected ? Color.green : Color.clear, lineWidth: 3)
        )

    }
}
