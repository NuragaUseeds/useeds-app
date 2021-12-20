//
//  ArticleDetailView.swift
//  useeds-app
//
//  Created by Dicky Buwono on 16/12/21.
//

import SwiftUI

struct ArticleDetailView: View {
    let article: Article
    var body: some View {
        VStack {
            Image(systemName: "book")
            Text(article.title)
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(Color.green)
            Text(article.category.rawValue)
            
            Image(article.image)
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/3, alignment: .center)
            
            Text(article.body)
        }.padding()
    }
}

struct ArticleDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleDetailView(article: Article(image: "previewArticle1", title: "How to hidroponics?", body: "Plant roots grow down through a medium while an absorbent “wick” draws nutrient-filled water up from a water reservoir to the root system zone. The growing medium allows for air (oxygen) to reach the roots.", category: .description, crateAt: "27/04/2021"))
    }
}
