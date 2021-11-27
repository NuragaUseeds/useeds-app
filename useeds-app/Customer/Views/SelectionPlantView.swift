//
//  SelectionPlantView.swift
//  useeds-app
//
//  Created by Dicky Buwono on 27/11/21.
//

import SwiftUI

struct SelectionPlantView: View {
    var plants: [String] = ["Bayam", "Kangkung", "Sayur", "Toge"]
    @State var selections = [String]()
    @State var show: Int? = 0
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 10) {
                Text("Hi User,")
                    .font(.system(size: 32, weight: .semibold))
                Text("What do you want to plant today?")
                    .font(.system(size: 16, weight: .regular))
                NavigationLink(destination: MultipleSelectionList(items: plants, selections: $selections)) {
                    Text("Select Your Plants")
                        .font(.system(size: 16, weight: .regular))
                        .foregroundColor(.black)
                }
                .padding(.vertical)
                .frame(width: UIScreen.main.bounds.width/1.2)
                .background(Color(.systemGray4))
                .cornerRadius(8)
            }
            
            Spacer()
            
            ScrollView {
                LazyVGrid(columns: columns, spacing: 40) {
                    if !selections.isEmpty {
                        ForEach(selections, id: \.self) { plant in
                            VStack {
                                Image(systemName: "person")
                                Text(plant)
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
                
            }.padding()
            
            Button {
                self.show = 1
            }label: {
                Text("PlANT NOW")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.white)
                    .padding(.vertical, 20)
                    .frame(width: UIScreen.main.bounds.width/1.2)
                    .background(Color.blue)
                    .cornerRadius(8)
                
            }
            NavigationLink(destination: OrderSummaryView(plants: plants), tag: 1, selection: $show) {
                    EmptyView()
                }
        }
        
    }
}

struct SelectionPlantView_Previews: PreviewProvider {
    static var previews: some View {
        SelectionPlantView()
    }
}

struct MultipleSelectionList: View {
    let items: [String]
    @Binding var selections: [String]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(self.items, id: \.self) { item in
                    MultipleSelectionRow(title: item, isSelected: self.selections.contains(item)) {
                        if self.selections.contains(item) {
                            self.selections.removeAll(where: { $0 == item })
                        }
                        else {
                            self.selections.append(item)
                        }
                    }
                }
            }
        }
    }
}

struct MultipleSelectionRow: View {
    var title: String
    var isSelected: Bool
    var action: () -> Void
    
    var body: some View {
        Button(action: self.action) {
            HStack {
                Text(self.title)
                if self.isSelected {
                    Spacer()
                    Image(systemName: "checkmark")
                }
            }
        }
    }
}
