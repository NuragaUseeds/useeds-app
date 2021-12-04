//
//  ContentView.swift
//  useeds-app
//
//  Created by Dicky Buwono on 27/11/21.
//

import SwiftUI

struct ContentView: View {
    init() {
            UITabBar.appearance().backgroundColor = UIColor(Color("Green5"))
        }
    var body: some View {
        NavigationView {
            TabView {
                HomeTabItem()
                    .tabItem {
                        Image(systemName: "house")
                        Text("Home")
                    }
                ProfileTabItem()
                    .tabItem {
                        Image(systemName: "person")
                        Text("Profile")
                    }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

