//
//  LoginViewModel.swift
//  useeds-app
//
//  Created by Muhammad Rifki Widadi on 06/12/21.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
}
