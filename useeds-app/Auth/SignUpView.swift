//
//  SignUpView.swift
//  useeds-app
//
//  Created by Muhammad Rifki Widadi on 18/12/21.
//

import SwiftUI

struct SignUpView: View {
    @Binding var name: String
    @Binding var email: String
    @Binding var password: String
    @Binding var phoneNumber: String
    @Binding var address: String
    
    var body: some View {
        Group {
            TextField("Nama", text: $name)
                .autocapitalization(.none)
                .cornerRadius(8)
            TextField("Email", text: $email)
                .keyboardType(.emailAddress)
                .autocapitalization(.none)
                .cornerRadius(8)
            SecureField("Password", text: $password)
            TextField("Nomor HP", text: $phoneNumber)
                .keyboardType(.phonePad)
                .autocapitalization(.none)
                .cornerRadius(8)
            TextField("Alamat", text: $address)
                .autocapitalization(.none)
                .cornerRadius(8)
        }
        .padding()

    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView(name: .constant("Dicky"), email: .constant("Dicky@email.com"), password: .constant("ini harusnya gak keliatan"), phoneNumber: .constant("085345765887"), address: .constant("Pramulih, Sumsel"))
            .previewLayout(.sizeThatFits)
    }
}
