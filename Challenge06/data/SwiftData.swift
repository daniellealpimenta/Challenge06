//
//  SwiftData.swift
//  Challenge06
//
//  Created by Daniel Leal PImenta on 26/06/25.
//

import Foundation
import SwiftData

@Model
class ApiModelClass: Identifiable {
    var id: Int
    var name: String
    var backgroundImage : String
    
    init(_ game: ApiModel) {
        self.id = game.id
        self.name = game.name
        self.backgroundImage = game.background_image
    }
}
