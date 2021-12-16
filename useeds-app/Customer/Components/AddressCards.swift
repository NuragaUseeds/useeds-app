//
//  AddressCards.swift
//  useeds-app
//
//  Created by Dicky Buwono on 27/11/21.
//

import SwiftUI

struct AddressCards: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Admin user")
                    .fontWeight(.bold)
                Spacer()
                Text("Edit")
            }
            Text("(+62) 813 9577 8125")
                .padding(.bottom)
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam")
                .foregroundColor(.gray)
                .font(.system(size: 10))
            
            
        }
        .padding()
        .background(Color("Green3"))
        .cornerRadius(16)
    }
}

struct AddressCards_Previews: PreviewProvider {
    static var previews: some View {
        AddressCards()
            .previewLayout(.sizeThatFits)
    }
}
