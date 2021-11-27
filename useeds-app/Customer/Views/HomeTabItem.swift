//
//  HomeView.swift
//  useeds-app
//
//  Created by Dicky Buwono on 27/11/21.
//

import SwiftUI

struct HomeTabItem: View {
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    @State var plant = [String]()
    
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            VStack(alignment: .trailing) {
                Text("Monitoring")
                    .font(.system(size: 28))
                    .foregroundColor(.white)
                Text("Status")
                    .font(.system(size: 28))
                    .padding(.bottom, 20)
                    .foregroundColor(.white)
                
                CardHome()
                    .shadow(color: .black.opacity(0.2), radius: 9, x: 0, y: 3)
                
            }
            .padding()
            ZStack {
                if plant.isEmpty {
                    VStack {
                        Image("Hands")
                            .font(.system(size: 70))
                        Text("Add your plant first")
                            .font(.system(size: 20, weight: .light))
                    }
                }
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 40) {
                        NavigationLink(destination: SelectionPlantView()) {
                            Image(systemName: "plus")
                                .font(.system(size: 70))
                        }
                        if !plant.isEmpty {
                            ForEach(plant, id: \.self) { plant in
                                Text(plant)
                            }
                        }
                    }
                    
                }.padding()
            }
            
            
        }
        .padding(.top, 40)
        .background(
            ZStack(alignment: .bottom) {
                Image("HomeBg")
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width)
                    .clipped()
                Rectangle()
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/1.35, alignment: .center)
                    .foregroundColor(Color.white)
                    .cornerRadius(40)
            }
            
        )
        .edgesIgnoringSafeArea(.all)
        .navigationBarHidden(true)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeTabItem()
    }
}
