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
            Plant(image: "Selada", name: "Selada", description: "Adalah jenis tanaman yang paling banyak ditanam", mission: [Mission(id: 1, airStatus: .need, nutrisiStatus: .need, time: "7"), Mission(id: 2, airStatus: .need, nutrisiStatus: .need, time: "7")], category: .free, price: 0),
            Plant(image: "Seledri", name: "Seledri", description: "Adalah jenis tanaman yang paling banyak ditanam", mission: [Mission(id: 1, airStatus: .need, nutrisiStatus: .need, time: "7"), Mission(id: 2, airStatus: .need, nutrisiStatus: .need, time: "7")], category: .free, price: 0),
            Plant(image: "Bayam", name: "Bayam", description: "Adalah jenis tanaman sehat", mission: [Mission(id: 1, airStatus: .need, nutrisiStatus: .need, time: "7"), Mission(id: 2, airStatus: .need, nutrisiStatus: .need, time: "07.00")], category: .premium, price: 3000),
            Plant(image: "Mint", name: "Mint", description: "Adalah jenis tanaman sehat dan bikin gendut", mission: [Mission(id: 1, airStatus: .need, nutrisiStatus: .need, time: "7"), Mission(id: 2, airStatus: .need, nutrisiStatus: .need, time: "7")], category: .premium, price: 3000)
        ],
        address: "Jakarta selatan")
}
