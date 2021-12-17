//
//  SelectionPlantView.swift
//  useeds-app
//
//  Created by Dicky Buwono on 27/11/21.
//

import SwiftUI

struct SelectionPlantView: View {
    @State var selections = [Plant]()
    @State var show: Int? = 0
    @ObservedObject var data = JsonHelper()
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ZStack(alignment: .top) {
            Image("RactBg")
            
            VStack {
                VStack(alignment: .leading, spacing: 10) {
                    Text("Hi User,")
                        .font(.system(size: 32, weight: .semibold))
                        .foregroundColor(.white)
                    Text("What do you want to plant today?")
                        .font(.system(size: 16, weight: .regular))
                        .foregroundColor(.white)
                    NavigationLink(destination: PlantSelectionView(items: data.plants, selections: $selections)) {
                        if !selections.isEmpty {
                            Text("Edit Your Plants")
                                .font(.system(size: 16, weight: .regular))
                                .foregroundColor(.gray)
                                .frame(width: UIScreen.main.bounds.width/1.2)
                                .padding(.vertical)
                                .background(Color.white)
                                .cornerRadius(8)
                        } else {
                            Text("Select Your Plants")
                                .font(.system(size: 16, weight: .regular))
                                       .foregroundColor(.gray)
                                .frame(width: UIScreen.main.bounds.width/1.2)
                                .padding(.vertical)
                                .background(Color.white)
                                .cornerRadius(8)
                        }
                    }
                }
                
                Spacer(minLength: 100)
                
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 40) {
                        if !selections.isEmpty {
                            ForEach(selections, id: \.id) { plant in
                                VStack {
                                    Image(systemName: "person")
                                    Text(plant.name)
                                }
                                .frame(width: UIScreen.main.bounds.width/3, height: UIScreen.main.bounds.width/3)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 24)
                                        .stroke(Color.green)
                                )
                                .padding(.top)
                                
                            }
                        }
                    }
                    
                }
                .padding()
                
                Button {
                    self.show = 1
                }label: {
                    Text("PlANT NOW")
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(selections.isEmpty ? .gray : .white)
                        .padding(.vertical, 20)
                        .frame(width: UIScreen.main.bounds.width/1.2)
                        .background(selections.isEmpty ? Color(.systemGray4) : Color("BlueButton"))
                        .cornerRadius(8)
                    
                }.disabled(selections.isEmpty)
                NavigationLink(destination: OrderSummaryView(plants: selections), tag: 1, selection: $show) {
                    EmptyView()
                }
            }.padding(.top, 100)
        }.edgesIgnoringSafeArea(.top)
        
    }
}

struct SelectionPlantView_Previews: PreviewProvider {
    static var previews: some View {
        SelectionPlantView()
    }
}
