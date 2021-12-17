//
//  ContentView.swift
//  useeds-app
//
//  Created by Dicky Buwono on 27/11/21.
//

import SwiftUI

struct ContentView: View {
    init() {
        let standardAppearance = UITabBarAppearance()
        UITabBar.appearance().backgroundColor = UIColor(Color("Green5"))
        UITabBar.appearance().barTintColor = UIColor(Color("Green5"))
        standardAppearance.backgroundColor = UIColor(Color("Green5"))
        standardAppearance.stackedLayoutAppearance.focused.titleTextAttributes = [.foregroundColor: UIColor.white]
        standardAppearance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.white]
        standardAppearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor.black]
        standardAppearance.stackedLayoutAppearance.normal.iconColor = UIColor(Color.white)
        UITabBar.appearance().standardAppearance = standardAppearance
        
    }
    var body: some View {
        NavigationView {
            TabView {
                HomeTabItem()
                    .tabItem {
                        Image(systemName: "house")
                        Text("Home")
                    }
                
                ArticleTabItem()
                    .tabItem {
                        Image(systemName: "newspaper")
                        Text("Articles")
                    }
                
                HistoryTabItem()
                    .tabItem {
                        Image(systemName: "clock.arrow.circlepath")
                        Text("History")
                    }
                
                ProfileTabItem()
                    .tabItem {
                        Image(systemName: "person")
                        Text("Profile")
                    }
                
            }
            .accentColor(.black)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

