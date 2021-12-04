//
//  Customer.swift
//  useeds-app
//
//  Created by Dicky Buwono on 02/12/21.
//

import Foundation

struct Customer: Codable, Identifiable {
    var id = UUID().uuidString
    var name: String
    var email: String
    var photo: String?
    var phoneNumber: String
    var plants: [Plant]?
    var address: String?
}
