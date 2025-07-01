//
//  ApiModel.swift
//  Challenge06
//
//  Created by israel lacerda gomes santos on 27/06/25.
//

import Foundation

<<<<<<< HEAD
struct ApiModel : Codable, Identifiable {
=======
struct ApiModel : Codable, Identifiable, Equatable {
>>>>>>> 550c4dddb216e20d10f711482f1d1390b337098f
    var id: Int
    let name: String
    let background_image: String
}

struct ApiResponse : Codable {
    let results : [ApiModel]
}

