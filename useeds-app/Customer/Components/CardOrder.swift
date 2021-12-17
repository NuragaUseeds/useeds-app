//
//  CardOrder.swift
//  useeds-app
//
//  Created by Dicky Buwono on 27/11/21.
//

import SwiftUI

struct CardOrder: View {
    let plant: Plant
    var body: some View {
        HStack {
            Image(systemName: "person")
                .font(.system(size: 70))
            VStack(alignment: .leading, spacing: 10) {
                Text(plant.name)
                    .font(.system(size: 16))
                Text(plant.category.rawValue)
                    .font(.system(size: 12))
                    .foregroundColor(.gray)
                Text("Rp. \(plant.price)")
                    .font(.system(size: 12, weight: .bold))
            }
            Spacer()
        }
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color("Green5"))
        )
        .background(Color.clear)
        
    }
}

struct CardOrder_Previews: PreviewProvider {
    static var previews: some View {
        CardOrder(plant: (Customer.preview.plants?[0])!)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
