//
//  OrderSummaryView.swift
//  useeds-app
//
//  Created by Dicky Buwono on 27/11/21.
//

import SwiftUI

struct OrderSummaryView: View {
    let plants: [String]
    var body: some View {
        VStack {
            
            Text("Order Summary")
            
            List {
                ForEach(plants, id: \.self) { item in
                    Text(item)
                }
            }
            
            Spacer()
            
            Button {
                let kata = plants.joined(separator: "%0a")
                if let url = URL(string: "https://wa.me/+6282176835992?text=hello%0\(kata)"),
                UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:])
                }
            }label: {
                Text("Checkout")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.white)
                    .padding(.vertical, 20)
                    .frame(width: UIScreen.main.bounds.width/1.2)
                    .background(Color.blue)
                    .cornerRadius(8)
                
            }
        }
        
        
    }
}

struct OrderSummaryView_Previews: PreviewProvider {
    static var previews: some View {
        OrderSummaryView(plants: ["kuangkung", "bayam", "sayur"])
    }
}
