//
//  LoginView.swift
//  useeds-app
//
//  Created by Muhammad Rifki Widadi on 29/11/21.
//

import SwiftUI

struct AuthView: View {
    @State var isLogin = false
    @State var isShowImagePicker = false
    @State var image: UIImage?

    @StateObject var viewModel = CustomerViewModel()

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
                                    Image(systemName: "person.fill")
                                        .font(.system(size: 64))
                                        .padding()
                                        .foregroundColor(Color(.label))
                                }
                            }
                            .overlay(RoundedRectangle(cornerRadius: 64).stroke(Color.black, lineWidth: 3))


                        }
                        SignUpView(name: $viewModel.name, email: $viewModel.email, password: $viewModel.password, phoneNumber: $viewModel.phoneNumber, address: $viewModel.address)
                            .background(Color.white)

                    } else {
                        LoginView(email: $viewModel.email, password: $viewModel.password)
                            .background(Color.white)
                    }

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

                    Text(viewModel.errorMessage)
                        .foregroundColor(.red)
                }
                .padding(16)
            }
            .navigationTitle(isLogin ? "Login": "SignUp")
            .background(Color.gray.opacity(0.2).ignoresSafeArea())
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .fullScreenCover(isPresented: $isShowImagePicker, onDismiss: nil) {
            ImagePicker(image: $image)
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


            viewModel.errorMessage = "Successfully logged in as a user: \(result?.user.uid ?? "")"

            ContentView()
        }
    }

    private func createNewAccount() {
        FirebaseManager.shared.auth.createUser(withEmail: viewModel.email, password: viewModel.password) { result, error in
            if let error = error {
                viewModel.errorMessage = "Failed to create user: \(error)"
                return
            }

            viewModel.errorMessage = "Successfully created user: \(result?.user.uid ?? "")"
            viewModel.uploadImageToStorage(image: image)
            ContentView()
        }
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}
