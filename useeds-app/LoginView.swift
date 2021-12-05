//
//  LoginView.swift
//  useeds-app
//
//  Created by Muhammad Rifki Widadi on 29/11/21.
//

import SwiftUI

struct LoginView: View {
    @State var isLogin = false
    @State var email = ""
    @State var password = ""
    @State var errorMessage = ""

    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    Picker(selection: $isLogin, label: Text("Picker here")) {
                        Text("Login")
                            .tag(true)
                        Text("SignUp")
                            .tag(false)
                    }
                    .pickerStyle(.segmented)

                    if !isLogin {
                        Button {

                        } label: {
                            Image(systemName: "person.fill")
                                .font(.system(size: 64))
                                .padding()
                        }
                    }

                    Group {
                        TextField("Email", text: $email)
                            .keyboardType(.emailAddress)
                            .autocapitalization(.none)
                        SecureField("Password", text: $password)
                    }
                    .padding(12)
                    .background(Color.white)
                    .cornerRadius(5)


                    Button {
                        handleAction()
                    } label: {
                        Text(isLogin ? "Login": "SignUp")
                            .padding(.vertical, 18)
                            .frame(width: UIScreen.main.bounds.width - 32, height: 50)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(5)

                    }

                    Text(self.errorMessage)
                        .foregroundColor(.red)
                }
                .padding(16)
            }
            .navigationTitle(isLogin ? "Login": "SignUp")
            .background(Color.gray.opacity(0.2).ignoresSafeArea())
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

extension LoginView {
    private func handleAction() {
        if isLogin {
            userLogin()
        } else {
            createNewAccount()
        }
    }

    private func userLogin() {
        FirebaseManager.shared.auth.signIn(withEmail: email, password: password) {
            result, error in
                if let error = error {
                    self.errorMessage = "Failed to logged in as user: \(error)"
                    return
                }

            self.errorMessage = "Successfully logged in as a user: \(result?.user.uid ?? "")"
        }
    }

    private func createNewAccount() {
        FirebaseManager.shared.auth.createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                self.errorMessage = "Failed to create user: \(error)"
                return
            }

            self.errorMessage = "Successfully created user: \(result?.user.uid ?? "")"
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
