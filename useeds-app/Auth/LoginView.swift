//
//  LoginView.swift
//  useeds-app
//
//  Created by Muhammad Rifki Widadi on 18/12/21.
//

import SwiftUI

struct LoginView: View {
    @Binding var email: String
    @Binding var password: String

    var body: some View {
        Group {
            TextField("Email", text: $email)
                .keyboardType(.emailAddress)
                .autocapitalization(.none)
            SecureField("Password", text: $password)
        }
        .padding()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(email: .constant("contoh@email.com"), password: .constant("contoh password"))
            .previewLayout(.sizeThatFits)
    }
}
