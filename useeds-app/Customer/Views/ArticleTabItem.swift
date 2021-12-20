//
//  ArticleTabItem.swift
//  useeds-app
//
//  Created by Dicky Buwono on 16/12/21.
//

import SwiftUI

enum Cats: String, CaseIterable {
    
    case all = "All"
    case tech = "Techniques"
    case desc = "Desc"
    
    var localizedName: LocalizedStringKey { LocalizedStringKey(rawValue) }
}

struct ArticleTabItem: View {
    @State var articles = Article.preview
    @State var category: Cats = .all
    var body: some View {
        ZStack(alignment: .top) {
            Image("Bg")
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/3)
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    Text("Today's Read")
                        .font(.system(size: 32, weight: .bold))
                        .foregroundColor(Color("Green5"))
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(articles, id: \.id) { item in
                                NavigationLink(destination: ArticleDetailView(article: item)) {
                                    ArticleCards(article: item)
                                }
                            }
                        }
                    }
                    
                    VStack(alignment: .leading, spacing: 20) {
                        Text("For You")
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(Color("Green5"))
                        ScrollView(.horizontal) {
                            HStack {
                                ForEach(Cats.allCases, id: \.self) { item in
                                    CategoryStack(cats: item, isSelected: self.category == item, onSelect: { selectedValue in
                                        self.category = selectedValue
                                    })
                                }
                            }.padding(5)
                        }
                        
                        let articlesTech = articles.filter { arti in
                            return arti.category == .technique
                        }
                        let articlesDesc = articles.filter { arti in
                            return arti.category == .description
                        }
                        if category == .all {
                            ForEach(articles, id: \.id) { item in
                                NavigationLink(destination: ArticleDetailView(article: item)) {
                                    VStack {
                                        ArticleList(article: item)
                                    }
                                }
                            }
                        }else if category == .tech {
                            ForEach(articlesTech, id: \.id) { item in
                                NavigationLink(destination: ArticleDetailView(article: item)) {
                                    VStack {
                                        ArticleList(article: item)
                                    }
                                }
                            }
                        }else {
                            ForEach(articlesDesc, id: \.id) { item in
                                NavigationLink(destination: ArticleDetailView(article: item)) {
                                    VStack {
                                        ArticleList(article: item)
                                    }
                                }
                            }
                        }
                    }
                }
            }
            .padding()
            .padding(.top, 50)
        }
        
        .navigationBarHidden(true)
        .edgesIgnoringSafeArea(.top)
    }
}

struct ArticleTabItem_Previews: PreviewProvider {
    static var previews: some View {
        ArticleTabItem()
    }
}
