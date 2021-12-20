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
        VStack(spacing: 20) {
            VStack(spacing: 10) {
                Image(systemName: "book")
                    .font(.system(size: 30))
                    .foregroundColor(Color.greenColor5)
                Text(article.title)
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(Color.greenColor5)
                Text(article.category.rawValue)
                    .font(.system(size: 14, weight: .bold))
                    .foregroundColor(Color.gray)
            }
            
            
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
