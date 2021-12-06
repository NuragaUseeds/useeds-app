//
//  HomeViewModel.swift
//  useeds-app
//
//  Created by Dicky Buwono on 05/12/21.
//

import Foundation
import Combine
import SwiftUI

extension HomeTabItem {
    class ViewModel: ObservableObject {
        @Published var customer: Customer = .preview
    }
}
