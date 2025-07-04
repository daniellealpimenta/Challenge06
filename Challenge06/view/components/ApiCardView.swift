//
//  ApiCardView.swift
//  Challenge06
//
//  Created by Daniel Leal PImenta on 30/06/25.
//

import SwiftUI

struct ApiCardView: View {
    
    let game: ApiModel
    
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
        .cornerRadius(30)

    }
}


struct ApiCardItemBox: View {
    let game: ApiModel
    
    var body: some View {
        VStack(spacing: 10) {
            AsyncImage(url: URL(string: game.background_image)) { image in
                image
                    .image?
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 160, height: 80)
                    .clipShape(RoundedRectangle(cornerRadius: 25))
            }
            Text(game.name)
                .font(.caption2)
                .multilineTextAlignment(.center)
        }
        .padding(8)
        .cornerRadius(30)

    }
}
