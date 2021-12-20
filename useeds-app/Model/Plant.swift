//
//  Plant.swift
//  useeds-app
//
//  Created by Dicky Buwono on 02/12/21.
//

import Foundation
import SwiftUI


struct Plant: Codable, Identifiable {
    var id = UUID().uuidString
    var image: String
    var name: String
    var description: String
    var mission: [Mission]
    var category: Category
    var payStatus: PayStatus?
    var createAt = Date()
    var price: Int
    
    private enum CodingKeys: String, CodingKey {
        case name
        case image
        case description
        case category
        case mission
        case price
    }
}

enum PayStatus: String, Codable {
    case done = "Done"
    case waitingConfirmation = "Waiting Confirmation"
    case onProgress = "Need to pay"
}

enum Category: String, Codable {
    case premium = "Premium"
    case free = "Free"
}
