//
//  LoginView.swift
//  useeds-app
//
//  Created by Muhammad Rifki Widadi on 29/11/21.
//

import SwiftUI

struct LoginView: View {
    @State var isLogin = false
    @ObservedObject var viewModel = LoginViewModel()
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Image("PlantBgWhite")
                .resizable()
                .opacity(0.3)
            ScrollView {
                VStack{
                    if !isLogin {
                        VStack(alignment: .leading) {
                            Text("New Account")
                                .font(.system(size: 32, weight: .semibold))
                                .foregroundColor(.white)
                            Text("Create your account to get the access this app")
                                .padding(.bottom, 50)
                                .foregroundColor(.white)
                        }
                    }else {
                        VStack(spacing: 10) {
                            Image("Useeds")
                            Text("Welcome!")
                                .font(.system(size: 32, weight: .semibold))
                                .foregroundColor(.white)
                            Text("Please enter your registered\nemail to continue")
                                .multilineTextAlignment(.center)
                                .foregroundColor(.white)
                                .padding(.bottom, 50)
                        }
                    }
                    
                    Group {
                        TextField("Email", text: $viewModel.email)
                            .keyboardType(.emailAddress)
                            .autocapitalization(.none)
                        SecureField("Password", text: $viewModel.password)
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(8)
                    
                    
                    Button {
                        handleAction()
                    } label: {
                        Text(isLogin ? "Login": "SignUp")
                            .font(.system(size: 20, weight: .bold))
                            .padding(.vertical, 18)
                            .frame(width: UIScreen.main.bounds.width - 32, height: 50)
                            .background(Color.yellowButton)
                            .foregroundColor(.white)
                            .cornerRadius(5)
                        
                    }.padding(.top, 50)
                    
                    
                    Text(viewModel.errorMessage)
                        .foregroundColor(.red)
                    
                    if !isLogin {
                        HStack {
                            Text("Already have account ?")
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .semibold))
                            Button {
                                isLogin = true
                            }label: {
                                Text("SignUp")
                                    .foregroundColor(.black)
                                    .font(.system(size: 16, weight: .semibold))
                            }
                        }
                    }else {
                        HStack {
                            Text("Don't have account ?")
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .semibold))
                            Button {
                                isLogin = false
                            }label: {
                                Text("SignIn")
                                    .foregroundColor(.black)
                                    .font(.system(size: 16, weight: .semibold))
                            }
                        }
                    }
                }
                .padding(16)
            }
            .padding(.horizontal)
            .padding(.top, 70)
        }
        
        .background(LinearGradient(gradient: Gradient(colors: [Color.greenColor5, Color.greenColor4, Color.greenColor4]), startPoint: .bottomLeading, endPoint: .topTrailing))
        .edgesIgnoringSafeArea(.all)
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
        FirebaseManager.shared.auth.signIn(withEmail: viewModel.email, password: viewModel.password) {
            result, error in
            if let error = error {
                viewModel.errorMessage = "Failed to logged in as user: \(error)"
                return
            }
            
            viewModel.errorMessage = "Successfully logged in as a user: \(result?.user.uid ?? "")"
        }
    }
    
    private func createNewAccount() {
        FirebaseManager.shared.auth.createUser(withEmail: viewModel.email, password: viewModel.password) { result, error in
            if let error = error {
                viewModel.errorMessage = "Failed to create user: \(error)"
                return
            }
            
            viewModel.errorMessage = "Successfully created user: \(result?.user.uid ?? "")"
            isLogin = true
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
