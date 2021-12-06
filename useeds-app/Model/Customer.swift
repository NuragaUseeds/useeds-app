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

extension Customer {
    static let preview = Customer(
        id: "L34zGzxCO6XpMOkpqR9sBYa1Rse2",
        name: "Rangg",
        email: "buwonodirga@gmail.com",
        photo: "dsdsds",
        phoneNumber: "082176835992",
        plants: [
            Plant(name: "Kangkung", description: "Adalah jenis tanaman yang paling banyak ditanam", category: .free),
            Plant(name: "Toge", description: "Adalah jenis tanaman yang paling banyak ditanam", category: .free),
            Plant(name: "Bayam", description: "Adalah jenis tanaman sehat", category: .premium),
            Plant(name: "Kentang", description: "Adalah jenis tanaman sehat dan bikin gendut", category: .premium)
        ],
        address: "Jakarta selatan")
}
