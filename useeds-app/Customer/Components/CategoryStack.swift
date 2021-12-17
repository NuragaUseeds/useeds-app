//
//  CategoryStack.swift
//  useeds-app
//
//  Created by Dicky Buwono on 16/12/21.
//

import SwiftUI

struct CategoryStack: View {
    var cats: Cats
    var isSelected: Bool
    var onSelect: ((Cats) -> Void) = {_ in}
    var body: some View {
        Text(cats.localizedName)
            .font(.system(size: 12, weight: .bold))
            .padding(.vertical, 10)
            .padding(.horizontal, 20)
            .background(isSelected ?  Color("Green5"): Color.white)
            .foregroundColor(isSelected ? Color.white : Color("Green5"))
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 9)
                    .stroke(Color("Green5"))
            )
            .onTapGesture {
                self.onSelect(self.cats)
            }
    }
}

struct CategoryStack_Previews: PreviewProvider {
    static var previews: some View {
        CategoryStack(cats: .all, isSelected: false)
    }
}
