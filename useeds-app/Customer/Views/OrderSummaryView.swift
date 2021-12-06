//
//  OrderSummaryView.swift
//  useeds-app
//
//  Created by Dicky Buwono on 27/11/21.
//

import SwiftUI

struct OrderSummaryView: View {
    let plants: [Plant]
    @State var show: Int? = 0
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack(spacing: 0) {
                Text("Order Summary")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(Color("Green5"))
                    .padding(.top, 100)
                    .padding(.bottom)
                ScrollView  {
                    VStack(alignment: .leading) {
                        ForEach(plants, id: \.id) { item in
                            CardOrder(plant: item)
                        }
                    }
                    .padding()
                }
                
                VStack {
                    HStack {
                        Text("Sub total")
                            .font(.system(size: 16, weight: .bold))
                            .foregroundColor(Color("Green5"))
                        Spacer()
                        Text("Rp. 20.000")
                            .font(.system(size: 16, weight: .bold))
                            .foregroundColor(Color("Green5"))
                    }
                    .padding(.horizontal)
                    .padding(.top)
                    HStack {
                        Text("Delivery")
                            .font(.system(size: 16, weight: .bold))
                            .foregroundColor(Color("Green5"))
                        Spacer()
                        Text("Rp. 15.000")
                            .font(.system(size: 16, weight: .bold))
                            .foregroundColor(Color("Green5"))
                    }
                    .padding()
                    
                    HStack {
                        Text("Total")
                            .font(.system(size: 16, weight: .bold))
                            .foregroundColor(Color("Green5"))
                        Spacer()
                        Text("Rp. 15.000")
                            .font(.system(size: 16, weight: .bold))
                            .foregroundColor(Color("Green5"))
                    }
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 9)
                            .stroke(Color("Green5"))
                    )
                    .padding(.horizontal, 5)
                    .padding(.bottom)
                    Button {
                        self.show = 1
                    }label: {
                        Text("Checkout")
                            .font(.system(size: 16, weight: .black))
                            .foregroundColor(Color.white)
                            .padding(.vertical, 20)
                            .frame(width: UIScreen.main.bounds.width/1.2)
                            .background(Color("Green5"))
                            .cornerRadius(8)
                        
                    }
                    NavigationLink(destination: DeliveryView(plants: plants), tag: 1, selection: $show) {
                        EmptyView()
                    }
                }
                .padding()
                .padding(.bottom, 20)
                .frame(width: UIScreen.main.bounds.width)
                .background(Color.white)
                .cornerRadius(40)
            }
        }
        .background(Color("Green3"))
        .edgesIgnoringSafeArea(.bottom)
        .edgesIgnoringSafeArea(.top)
    }
}

struct OrderSummaryView_Previews: PreviewProvider {
    static var previews: some View {
        OrderSummaryView(plants: Customer.preview.plants!)
    }
}
