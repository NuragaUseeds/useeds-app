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
    var image: String?
    var name: String
    var description: String
    var category: Category
    var waterStatus: Status?
    var nutrientStatus: Status?
    var phCheck: String?
    var tempCheck: String?
    var payStatus: PayStatus?
    var statusMission: Mission?
    var plantingDuration : String?
    
    private enum CodingKeys: String, CodingKey {
        case name
        case description
        case category
    }
}


enum Status: String, Codable {
    case done = "Done"
    case need = "Need"
    case reject = "Failed"
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

enum Mission: String, Codable {
    case onProgress = "On Progress"
    case success = "Success"
    case failed = "Failed"
}
