//
//  PlantSelectionView.swift
//  useeds-app
//
//  Created by Dicky Buwono on 28/11/21.
//

import SwiftUI

struct PlantSelectionView: View {
    let items: [String]
    @Binding var selections: [String]
    init(items: [String], selections: Binding<[String]>) {
        self.items = items
        self._selections = selections
        UITableView.appearance().backgroundColor = UIColor(Color("Green3"))
    }
    var body: some View {
            VStack {
                Text("Plants")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(.green)
                    .padding(.top, 100)
                    .padding(.bottom)
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
            }.background(Color("Green3"))
            .edgesIgnoringSafeArea(.top)
    }
}

struct PlantSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        PlantSelectionView(items: ["Sayur", "Mayur", "Kangkung", "Bayam", "Ayam"], selections: .constant(["Sayur"]))
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
                    .foregroundColor(Color.black)
                if self.isSelected {
                    Spacer()
                    Image(systemName: "checkmark")
                        .foregroundColor(Color("Green5"))
                }
            }
        }
    }
}
