//
//  ApiModel.swift
//  Challenge06
//
//  Created by israel lacerda gomes santos on 27/06/25.
//

import Foundation

struct ApiModel : Codable, Identifiable, Equatable {
    var id: Int
    let name: String
    let background_image: String
}

struct ApiResponse : Codable {
    let results : [ApiModel]
}

