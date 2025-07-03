//
//  ApiModel.swift
//  Challenge06
//
//  Created by israel lacerda gomes santos on 27/06/25.
//

import Foundation
import SwiftUI

struct ApiModel: Codable, Identifiable, Equatable, Transferable, Hashable {
    var id: Int
    let name: String
    let background_image: String
    
    static var transferRepresentation: some TransferRepresentation {
        CodableRepresentation(contentType: .json)
    }
    
}

struct ApiResponse : Codable {
    let results : [ApiModel]
}

