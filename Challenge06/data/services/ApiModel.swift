//
//  ApiModel.swift
//  Challenge06
//
//  Created by israel lacerda gomes santos on 27/06/25.
//

import Foundation

struct ApiModel : Codable, Identifiable {
    var id: UUID
    let name: String
    let backgroundImage : String
}
    

