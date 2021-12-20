//
//  CustomerViewModel.swift
//  useeds-app
//
//  Created by Muhammad Rifki Widadi on 17/12/21.
//

import Foundation
import SwiftUI
import PhotosUI

class CustomerViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var name: String = ""
    @Published var photo: String = ""
    @Published var phoneNumber: String = ""
    @Published var address: String = ""
    @Published var errorMessage = ""

    func uploadImageToStorage(image: UIImage?) {
        guard let uid = FirebaseManager.shared.auth.currentUser?.uid else { return }
        let ref = FirebaseManager.shared.storage.reference(withPath: uid)
        guard let imageData = image?.jpegData(compressionQuality: 0.5) else { return }

        ref.putData(imageData, metadata: nil) { metadata, err in
            if let err = err {
                self.errorMessage = "Failed to push image to Storage: \(err)"
                return
            }

            ref.downloadURL { url, err in
                if let err = err {
                    self.errorMessage = "Failed to retrieve downloadURL: \(err)"
                    return
                }

                self.errorMessage = "Successfully stored image with url: \(url?.absoluteString ?? "")"
                self.photo = url?.absoluteString ?? ""
                self.storeCustomerInformation()
                print(url?.absoluteString ?? "")
            }


        }
    }

    func storeCustomerInformation() {
        guard let uid = FirebaseManager.shared.auth.currentUser?.uid else { return }
        let customerData = [
            "nama": self.name,
            "email": self.email,
            "uid": uid,
            "photo": self.photo,
            "phoneNumber": self.phoneNumber,
            "address": self.address
        ]

        FirebaseManager.shared.firestore.collection("customer")
            .document(uid).setData(customerData) { err in
                if let err = err {
                    print(err)
                    self.errorMessage = "\(err)"
                    return
                }

                print("Success")
            }
    }
}
