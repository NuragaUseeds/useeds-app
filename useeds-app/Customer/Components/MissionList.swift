//
//  MissionList.swift
//  useeds-app
//
//  Created by Dicky Buwono on 14/12/21.
//

import SwiftUI

struct MissionList: View {
    let plant: Plant
    var body: some View {
        VStack(alignment: .leading) {
            ForEach(plant.mission, id: \.id) { item in
                Text("Day \(item.id)")
                HStack {
                    Image("WaterIcon")
                        .resizable()
                        .frame(width: 50, height: 50, alignment: .center)
                    VStack(alignment: .leading) {
                        Text("Watering")
                            .font(.system(size: 16, weight: .bold))
                        Text(item.airStatus?.rawValue ?? "")
                            .font(.system(size: 12, weight: .regular))
                            .foregroundColor(Color.gray)
                    }
                }
                Divider()
                HStack {
                    Image("TempIcon")
                        .resizable()
                        .frame(width: 50, height: 50, alignment: .center)
                    VStack(alignment: .leading) {
                        Text("Watering")
                            .font(.system(size: 16, weight: .bold))
                        Text(item.airStatus?.rawValue ?? "")
                            .font(.system(size: 12, weight: .regular))
                            .foregroundColor(Color.gray)
                    }
                }
                
            }
        }
        
    }
}

struct MissionList_Previews: PreviewProvider {
    static var previews: some View {
        MissionList(plant: Customer.preview.plants![0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
