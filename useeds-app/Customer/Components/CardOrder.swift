//
//  CardOrder.swift
//  useeds-app
//
//  Created by Dicky Buwono on 27/11/21.
//

import SwiftUI

struct CardOrder: View {
    var body: some View {
        HStack {
            Image(systemName: "person")
                .font(.system(size: 70))
            VStack(alignment: .leading, spacing: 10) {
                Text("Lettuce")
                    .font(.system(size: 16))
                Text("Untuk konsumsi pribadi")
                    .font(.system(size: 12))
                    .foregroundColor(.gray)
                Text("Rp. 3000")
                    .font(.system(size: 12, weight: .bold))
            }
            Spacer()
        }
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color("Green5"))
        )
        .background(Color.clear)
        
    }
}

struct CardOrder_Previews: PreviewProvider {
    static var previews: some View {
        CardOrder()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
