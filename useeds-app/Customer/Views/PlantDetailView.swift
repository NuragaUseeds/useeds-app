//
//  PlantDetailView.swift
//  useeds-app
//
//  Created by Dicky Buwono on 07/12/21.
//

import SwiftUI

struct PlantDetailView: View {
    let plant: Plant
    @State private var selectedIndex = 0
    var body: some View {
        ZStack(alignment: .top) {
            Image("Bg")
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/2)
                .edgesIgnoringSafeArea(.top)
            VStack {
                Picker("Try", selection: $selectedIndex) {
                    Text("Overview").tag(0)
                    Text("History").tag(1)
                }.pickerStyle(SegmentedPickerStyle())
                    .padding()
                    .padding(.bottom, 40)
                if selectedIndex == 0 {
                    Image("Hands")
                        .resizable()
                        .frame(width: UIScreen.main.bounds.width/1.5, height: UIScreen.main.bounds.height/3.5, alignment: .center)
                        .scaledToFill()
                    VStack(alignment: .leading, spacing: 10) {
                        Text(plant.name)
                            .foregroundColor(Color("BlueButton"))
                            .font(.system(size: 40, weight: .bold))
                        Text("(Nama Latin)")
                            .font(.system(size: 16))
                            .italic()
                        Text(plant.description)
                            .font(.system(size: 12, weight: .bold))
                            .fixedSize(horizontal: false, vertical: true)
                            .padding(.vertical, 40)
                            .overlay(
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(Color.blue)
                                    .frame(width: UIScreen.main.bounds.width/1.2)
                            )
                            .frame(width: UIScreen.main.bounds.width/1.2)
                        Text("Estimasi panen : 12 hari")
                            .font(.system(size: 12, weight: .bold))
                            .padding(.vertical)
                    }
                    
                    Spacer()
                    Button {
                        
                    }label: {
                        Text("Next Watering in 2h 5m")
                            .font(.system(size: 16, weight: .bold))
                            .italic()
                            .padding()
                    }
                    .frame(width: UIScreen.main.bounds.width/1.2)
                    .background(Color("BlueButton"))
                    .cornerRadius(10)
                    .padding()
                }else {
                    EmptyView()
                    Spacer()
                    Text("Hello")
                }
            }
            .padding()
        }
    }
}

struct PlantDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PlantDetailView(plant: (Customer.preview.plants?[2])!)
    }
}
