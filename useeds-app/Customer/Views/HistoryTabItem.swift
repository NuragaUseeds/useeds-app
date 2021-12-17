//
//  HistoryTabItem.swift
//  useeds-app
//
//  Created by Dicky Buwono on 16/12/21.
//

import SwiftUI

struct HistoryTabItem: View {
    @State var plant = Customer.preview.plants
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading) {
                Text("Riwayat Menanam")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(Color("Green5"))
                    .padding()
                if let plant = plant {
                    ForEach(plant, id: \.id) { item in
                        HistoryCards(plant: item)
                            .padding(5)
                    }
                }
            }
            
        }
        .padding()
        .padding(.top, 50)
        .navigationBarHidden(true)
        .edgesIgnoringSafeArea(.top)
    }
}

struct HistoryTabItem_Previews: PreviewProvider {
    static var previews: some View {
        HistoryTabItem()
    }
}
