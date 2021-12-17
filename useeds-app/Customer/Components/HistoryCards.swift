//
//  HistoryCards.swift
//  useeds-app
//
//  Created by Dicky Buwono on 17/12/21.
//

import SwiftUI

struct HistoryCards: View {
    let plant: Plant
    var body: some View {
        VStack(spacing: 10) {
            HStack {
                VStack(alignment: .leading, spacing: 10) {
                    Text("\(plant.createAt)")
                        .font(.system(size: 10))
                    Text(plant.name)
                        .font(.system(size: 20, weight: .bold))
                    Text("Durasi Tanaman: \(plant.mission.count) Hari")
                        .font(.system(size: 10, weight: .semibold))
                }
                
                Spacer()
                Image(plant.image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80, alignment: .center)
            }
            Button {
                
            }label: {
                Text("Details")
                    .font(.system(size: 12, weight: .bold))
                    .frame(width: UIScreen.main.bounds.width/1.2)
                    .padding(.vertical, 10)
                    .foregroundColor(.white)
                    .background(Color("Green5"))
                    .cornerRadius(8)
                    
            }
        }
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 24)
                .stroke(Color.black)
        )
        
    }
}

struct HistoryCards_Previews: PreviewProvider {
    static var previews: some View {
        HistoryCards(plant: Customer.preview.plants![0])
            .padding()
    }
}
