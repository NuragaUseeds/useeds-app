//
//  ArticleCards.swift
//  useeds-app
//
//  Created by Dicky Buwono on 16/12/21.
//

import SwiftUI

struct ArticleCards: View {
    let article: Article
    var body: some View {
        VStack {
            Image(article.image)
                .resizable()
                .frame(width: UIScreen.main.bounds.width/1.8, height: UIScreen.main.bounds.height/6, alignment: .center)
                .scaledToFill()
                .cornerRadius(16)
            HStack {
                Text(article.title)
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(Color("Green5"))
                Image(systemName: "bookmark")
                    .font(.system(size: 25, weight: .semibold))
                    .foregroundColor(Color("Green5"))
            }.padding(.horizontal, 5)
            
        }.frame(width: UIScreen.main.bounds.width/1.8, height: UIScreen.main.bounds.height/4, alignment: .center)
    }
}

struct ArticleCards_Previews: PreviewProvider {
    static var previews: some View {
        ArticleCards(article: Article.preview[0])
//            .previewLayout(.sizeThatFits)
//            .padding()
    }
}
