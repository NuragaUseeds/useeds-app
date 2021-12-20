////
////  PlantViewModel.swift
////  useeds-app
////
////  Created by Muhammad Rifki Widadi on 17/12/21.
////
//
//import Foundation
//import Firebase
//
//class PlantViewModel: ObservableObject {
//
//    @Published var list = [Plant]()
//
//    func uploadImageToStorage() {
//        //nama file image menggunakan UserId
//        guard let uid = FirebaseManager.shared.auth.currentUser?.uid else { return }
//        //penamaan path image di firebase menggunakan uid
//        let ref = FirebaseManager.shared.storage.reference(withPath: uid)
//        //image di compress menjadi setengah
//        guard let imageData = self.image?.jpegData(compressionQuality: 0.5) else { return }
//        ref.putData(imageData, metadata: nil) { metadata, err in
//            if let err = err {
//                //error message here
//                print(err)
//            }
//    }
//
//    func updateData(todoToUpdate: Todo) {
//
//        // Get a reference to the database
//        let db = Firestore.firestore()
//
//        // Set the data to update
//        db.collection("todos").document(todoToUpdate.id).setData(["name":"Updated: \(todoToUpdate.name)"], merge: true) { error in
//
//            // Check for errors
//            if error == nil {
//                // Get the new data
//                self.getData()
//            }
//        }
//    }
//
//    func deleteData(todoToDelete: Todo) {
//
//        // Get a reference to the database
//        let db = Firestore.firestore()
//
//        // Specify the document to delete
//        db.collection("todos").document(todoToDelete.id).delete { error in
//
//            // Check for errors
//            if error == nil {
//                // No errors
//
//                // Update the UI from the main thread
//                DispatchQueue.main.async {
//
//                    // Remove the todo that was just deleted
//                    self.list.removeAll { todo in
//
//                        // Check for the todo to remove
//                        return todo.id == todoToDelete.id
//                    }
//                }
//
//
//            }
//        }
//
//    }
//
//    func addData(name: String, notes: String) {
//
//        // Get a reference to the database
//        let db = Firestore.firestore()
//
//        // Add a document to a collection
//        db.collection("todos").addDocument(data: ["name":name, "notes":notes]) { error in
//
//            // Check for errors
//            if error == nil {
//                // No errors
//
//                // Call get data to retrieve latest data
//                self.getData()
//            }
//            else {
//                // Handle the error
//            }
//        }
//    }
//
//    func getData() {
//
//        // Get a reference to the database
//        let db = Firestore.firestore()
//
//        // Read the documents at a specific path
//        db.collection("todos").getDocuments { snapshot, error in
//
//            // Check for errors
//            if error == nil {
//                // No errors
//
//                if let snapshot = snapshot {
//
//                    // Update the list property in the main thread
//                    DispatchQueue.main.async {
//
//                        // Get all the documents and create Todos
//                        self.list = snapshot.documents.map { d in
//
//                            // Create a Todo item for each document returned
//                            return Todo(id: d.documentID,
//                                        name: d["name"] as? String ?? "",
//                                        notes: d["notes"] as? String ?? "")
//                        }
//                    }
//
//
//                }
//            }
//            else {
//                // Handle the error
//            }
//        }
//    }
//
//}
//
