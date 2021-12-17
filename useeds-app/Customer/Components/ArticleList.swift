//
//  ArticleList.swift
//  useeds-app
//
//  Created by Dicky Buwono on 16/12/21.
//

import SwiftUI

struct ArticleList: View {
    let article: Article
    var body: some View {
        HStack(spacing: 15) {
            Image(article.image)
                .resizable()
                .frame(width: 75, height: 75, alignment: .center)
                .scaledToFill()
                .cornerRadius(16)
            VStack (alignment: .leading, spacing: 10){
                Text(article.title)
                    .font(.system(size: 15, weight: .bold))
                    .foregroundColor(Color("Green5"))
                HStack {
                    Image(systemName: "clock")
                        .font(.system(size: 13, weight: .regular))
                        .foregroundColor(.gray)
                    Text(article.crateAt)
                        .font(.system(size: 13, weight: .regular))
                        .foregroundColor(.gray)
                }
            }
            Spacer()
            Image(systemName: "bookmark")
                .font(.system(size: 25, weight: .semibold))
                .foregroundColor(Color("Green5"))
        }
    }
}

struct ArticleList_Previews: PreviewProvider {
    static var previews: some View {
        ArticleList(article: Article.preview[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
