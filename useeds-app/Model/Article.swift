//
//  Article.swift
//  useeds-app
//
//  Created by Dicky Buwono on 16/12/21.
//

import Foundation

struct Article: Codable, Identifiable {
    var id = UUID().uuidString
    var image: String
    var title: String
    var body: String
    var category: Types
    var crateAt: String
    var additional: String?
}

enum Types: String, Codable {
    case technique = "Techniques"
    case description = "Description"
}

extension Article {
    static let preview = [Article(image: "previewArticle1", title: "What are the types of hydroponic systems?", body: "There are several types of hydroponic systems.\n Wick\n Plant roots grow down through a medium while an absorbent “wick” draws nutrient-filled water up from a water reservoir to the root system zone. The growing medium allows for air (oxygen) to reach the roots.", category: .technique , crateAt: "Feb 12, 2021"), Article(image: "previewArticle1", title: "What is hydroponic? and how important?", body: "There are several types of hydroponic systems.\n Wick\n Plant roots grow down through a medium while an absorbent “wick” draws nutrient-filled water up from a water reservoir to the root system zone. The growing medium allows for air (oxygen) to reach the roots.", category: .description , crateAt: "Feb 13, 2021")]
}
