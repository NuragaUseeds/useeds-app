//
//  FirebaseManager.swift
//  useeds-app
//
//  Created by Muhammad Rifki Widadi on 30/11/21.
//
import Firebase

class FirebaseManager: NSObject {
    let auth: Auth

    static let shared = FirebaseManager()

    override init() {
        FirebaseApp.configure()

        self.auth = Auth.auth()

        super.init()
    }
}
