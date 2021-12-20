//
//  LoginView.swift
//  useeds-app
//
//  Created by Muhammad Rifki Widadi on 29/11/21.
//

import SwiftUI

struct AuthView: View {
    @State private var isLogin = true
    @State private var isAuthSuccess = false
    @State private var isActive = false
    @State private var isShowImagePicker = false
    @State private var image: UIImage?
    
    @StateObject var viewModel = CustomerViewModel()
    var body: some View {
        NavigationView {
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
                            Button {
                                isShowImagePicker.toggle()
                            } label: {
                                
                                VStack {
                                    
                                    if let image = image {
                                        Image(uiImage: image)
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 128, height: 128)
                                            .cornerRadius(64)
                                    } else {
                                        Image(systemName: "person.badge.plus")
                                            .font(.system(size: 64))
                                            .padding(20)
                                            .foregroundColor(.white)
                                    }
                                }
                                .overlay(RoundedRectangle(cornerRadius: 64).stroke(Color.white, lineWidth: 3))
                                .padding()
                                
                                
                            }
                            SignUpView(name: $viewModel.name, email: $viewModel.email, password: $viewModel.password, phoneNumber: $viewModel.phoneNumber, address: $viewModel.address)
                                .background(Color.white)
                            
                        } else {
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
                            LoginView(email: $viewModel.email, password: $viewModel.password)
                                .background(Color.white)
                        }
                        
                        NavigationLink(destination: ContentView(), isActive: $isActive) {
                            Button {
                                handleAction()
                                if !isAuthSuccess {
                                    isActive.toggle()
                                }
                            } label: {
                                Text(isLogin ? "Login": "SignUp")
                                    .padding(.vertical, 18)
                                    .frame(width: UIScreen.main.bounds.width - 32, height: 50)
                                    .font(.system(size: 20, weight: .bold))
                                    .background(Color.yellowButton)
                                    .foregroundColor(.white)
                                    .cornerRadius(5)
                            }
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
                                    Text("SignIn")
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
                                    Text("SignUp")
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
            .fullScreenCover(isPresented: $isShowImagePicker, onDismiss: nil) {
                ImagePicker(image: $image)
            }
        }
    }
}

extension AuthView {
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
            //success
            isAuthSuccess.toggle()

            viewModel.errorMessage = "Successfully logged in as a user: \(result?.user.uid ?? "")"
        }
    }
    
    private func createNewAccount() {
        FirebaseManager.shared.auth.createUser(withEmail: viewModel.email, password: viewModel.password) { result, error in
            if let error = error {
                viewModel.errorMessage = "Failed to create user: \(error)"
                return
            }
            
            isAuthSuccess.toggle()
            
            viewModel.errorMessage = "Successfully created user: \(result?.user.uid ?? "")"
            viewModel.uploadImageToStorage(image: image)
        }
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}
