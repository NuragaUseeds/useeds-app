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
            Image(systemName: "person")
            Text(plant.name)
        }
        .frame(width: UIScreen.main.bounds.width/3, height: UIScreen.main.bounds.width/3)
        .overlay(
            RoundedRectangle(cornerRadius: 24)
                .stroke(Color.green)
        )
    }
}

struct RactangleCardPlants_Previews: PreviewProvider {
    static var previews: some View {
        RactangleCardPlants(plant: Customer.preview.plants![0])
            .previewLayout(.sizeThatFits)
    }
}
