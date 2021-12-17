//
//  PlantSelectionView.swift
//  useeds-app
//
//  Created by Dicky Buwono on 28/11/21.
//

import SwiftUI

struct PlantSelectionView: View {
    let items: [Plant]
    @Binding var selections: [Plant]
    init(items: [Plant], selections: Binding<[Plant]>) {
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
                    ForEach(items) { selectable in
                        Button(action: { toggleSelection(selectable: selectable) }) {
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(selectable.name)
                                        .foregroundColor(.black)
                                        .font(.system(size: 17, weight: .semibold))
                                    Text(selectable.category.rawValue)
                                        .foregroundColor(.gray)
                                        .font(.system(size: 15, weight: .regular))
                                }
                                Spacer()
                                if selections.contains { $0.id == selectable.id } {
                                    Image(systemName: "checkmark")
                                        .foregroundColor(.black)
                                }
                            }
                        }.tag(selectable.id)
                    }
                }
            }.background(Color("Green3"))
            .edgesIgnoringSafeArea(.top)
    }
    
    private func toggleSelection(selectable: Plant) {
        if let existingIndex = selections.firstIndex(where: { $0.id == selectable.id }) {
            selections.remove(at: existingIndex)
        } else {
            selections.append(selectable)
        }
    }
    
    
}

struct PlantSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        PlantSelectionView(items: Customer.preview.plants!, selections: .constant(Customer.preview.plants!))
    }
}

struct MultipleSelectionRow: View {
    var plant: Plant
    var isSelected: Bool
    var action: () -> Void
    
    var body: some View {
        Button(action: self.action) {
            HStack {
                Text(self.plant.name)
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
