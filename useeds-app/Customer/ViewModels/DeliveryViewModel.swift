//
//  DeliveryViewModel.swift
//  useeds-app
//
//  Created by Dicky Buwono on 16/12/21.
//

import Foundation
import SwiftUI

extension DeliveryView {
    class ViewModel: ObservableObject {
        @Published var plants: [Plant]
        
        init(plants: [Plant]) {
            self.plants = plants
        }
        
        var textBody: String {
            var array = [String]()
            for i in 0..<plants.count {
                array.append(plants[i].name)
            }
            return array.joined(separator: "%0a")
        }
    }
    
    
}
