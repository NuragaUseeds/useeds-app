//
//  Mission.swift
//  useeds-app
//
//  Created by Dicky Buwono on 14/12/21.
//

import Foundation
import SwiftUI

struct Mission: Codable, Identifiable {
    var id: Int
    var airStatus: Status?
    var nutrisiStatus: Status?
    var time: String 
}

enum Status: String, Codable {
    case done = "Done"
    case need = "Need"
    case reject = "Failed"
}
