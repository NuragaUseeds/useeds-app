//
//  OrderSummaryViewModel.swift
//  useeds-app
//
//  Created by Dicky Buwono on 17/12/21.
//

import Foundation

extension OrderSummaryView {
    class ViewModel: ObservableObject {
        @Published var subTotal = 0
        @Published var total = 0
        @Published var plants: [Plant]
        
        init(plants: [Plant]) {
            self.plants = plants
            
            calculateSubTotal(plants: self.plants)
            calculateTotal()
        }
        
        func calculateSubTotal(plants: [Plant]) {
            self.subTotal = plants.reduce(0, {$0 + $1.price})
        }
        
        func calculateTotal() {
            self.total = subTotal + 15000
        }
    }
}
