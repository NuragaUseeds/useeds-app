//
//  UserService.swift
//  useeds-app
//
//  Created by Muhammad Rifki Widadi on 06/12/21.
//

import FirebaseAuth

protocol UserServiceProtocol {
    func login(email: String, password: String, completion: @escaping (Result<Void, Error>) -> Void)
}

final class UserService: UserServiceProtocol {
    func login(email: String, password: String, completion: @escaping (Result<Void, Error>) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(()))
            }
        }
    }
}
