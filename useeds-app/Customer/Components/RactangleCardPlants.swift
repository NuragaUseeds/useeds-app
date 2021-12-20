//
//  RactangleCardPlants.swift
//  useeds-app
//
//  Created by Dicky Buwono on 05/12/21.
//

import SwiftUI

struct RactangleCardPlants: View {
    let plant: Plant
    var body: some View {
        VStack {
            Image(plant.image)
                .resizable()
                .scaledToFill()
                .frame(width: 80, height: 80, alignment: .center)
            Text(plant.name)
                .font(.system(size: 12, weight: .bold))
                .foregroundColor(Color.greenColor5)
        }
        .frame(width: UIScreen.main.bounds.width/3, height: UIScreen.main.bounds.width/3)
        .overlay(
            RoundedRectangle(cornerRadius: 24)
                .stroke(Color.greenColor5)
        )
    }
}

struct RactangleCardPlants_Previews: PreviewProvider {
    static var previews: some View {
        RactangleCardPlants(plant: Customer.preview.plants![0])
            .previewLayout(.sizeThatFits)
    }
}
