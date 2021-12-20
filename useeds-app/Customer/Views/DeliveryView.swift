//
//  DeliveryView.swift
//  useeds-app
//
//  Created by Dicky Buwono on 27/11/21.
//

import SwiftUI

struct DeliveryView: View {
    @State var selections: String = ""
    @StateObject private var viewModel: ViewModel
    init(plants: [Plant], total: Int) {
        let viewModel = ViewModel(plants: plants, total: total)
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    var body: some View {
        VStack {
            Text("Checkout")
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(Color("Green5"))
                .padding(.top, 100)
                .padding(.bottom)
            VStack(alignment: .leading) {
                Text("Delivery Address")
                AddressCards()
                    .padding(.vertical)
                Text("Select your payment method")
                NavigationLink(destination: PaymentView(selections: $selections)) {
                    if selections == "" {
                        Text("Select your payment")
                            .font(.system(size: 16, weight: .regular))
                            .foregroundColor(.black)
                    } else {
                        Text(selections)
                            .font(.system(size: 16, weight: .regular))
                            .foregroundColor(.black)
                    }
                }
                .padding(.vertical)
                .frame(width: UIScreen.main.bounds.width/1.2)
                .background(Color.white)
                .cornerRadius(8)
                .shadow(color: .black.opacity(0.2), radius: 9, x: 0, y: 3)
            }.padding()
            Spacer()
            HStack {
                Text("Order Total")
                    .foregroundColor(Color("Green5"))
                    .font(.system(size: 16, weight: .bold))
                Spacer()
                Text("Rp. \(viewModel.total)")
                    .foregroundColor(Color("Green5"))
                    .font(.system(size: 16, weight: .bold))
            }.padding()
            Button {
                if let url = URL(string: "https://wa.me/+6282176835992?text=hello%0\(viewModel.textBody)"),
                UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:])
                }
            }label: {
                Text("Proceed")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.white)
                    .padding(.vertical, 20)
                    .frame(width: UIScreen.main.bounds.width/1.2)
                    .background(Color("Green5"))
                    .cornerRadius(8)
                
            }
        }.padding(.horizontal)
        .edgesIgnoringSafeArea(.top)
    }
}

struct DeliveryView_Previews: PreviewProvider {
    static var previews: some View {
        DeliveryView(plants: Customer.preview.plants!, total: 0)
    }
}
