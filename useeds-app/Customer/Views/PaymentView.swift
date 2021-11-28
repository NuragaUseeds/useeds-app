//
//  PaymentView.swift
//  useeds-app
//
//  Created by Dicky Buwono on 28/11/21.
//

import SwiftUI

struct PaymentView: View {
    var items = ["Ovo", "Gopay", "Bank Transfer"]
    @Binding var selections: String
    init(selections: Binding<String>) {
        self._selections = selections
        UITableView.appearance().backgroundColor = UIColor(Color("Green3"))
    }
    var body: some View {
        VStack {
            Text("Payment Method")
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(.green)
                .padding(.top, 100)
                .padding(.bottom)
            
            List {
                ForEach(self.items, id: \.self) { item in
                    Button {
                        selections = item
                    } label: {
                        HStack {
                            Text(item)
                                .foregroundColor(.black)
                            Spacer()
                            if selections == item {
                                Image(systemName: "checkmark")
                                    .foregroundColor(Color("Green5"))
                            }
                        }
                    }
                }
            }
        }.background(Color("Green3"))
            .edgesIgnoringSafeArea(.top)
    }
}

struct PaymentView_Previews: PreviewProvider {
    static var previews: some View {
        PaymentView(selections: .constant("Ovo"))
    }
}
