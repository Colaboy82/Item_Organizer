//
//  StorageManager.swift
//  Item_Organizer
//
//  Created by Derrick Mu on 9/4/23.
//

import Foundation
import SwiftUI
import Firebase
import FirebaseStorage

class StorageManager: ObservableObject {
    let storage = Storage.storage()
    
    func uploadNewSetName(newSetName: String) {
        let storageRef = storage.reference().child("setName/(newSetName)")

    }

    func uploadImage(image: UIImage){
        let storageRef = storage.reference().child("images/image.jpg")
        // Resize the image to 200px in height with a custom extension
        //let resizedImage = image.aspectFit(200)

        // Convert the image into JPEG and compress the quality to reduce its size
        let data = image.jpegData(compressionQuality: 0.2)
        let metadata = StorageMetadata()
        metadata.contentType = "image/jpg"
        
        if let data = data {
                storageRef.putData(data, metadata: metadata) { (metadata, error) in
                        if let error = error {
                                print("Error while uploading file: ", error)
                        }

                        if let metadata = metadata {
                                print("Metadata: ", metadata)
                        }
                }
        }
    }
    
    func listAllFiles() {
        let storageRef = storage.reference().child("images")
        storageRef.listAll { (result, error) in
                if let error = error {
                        print("Error while listing all files: ", error)
                }

                for item in result!.items {
                        print("Item in images folder: ", item)
                }
        }
    }
    
    func listItem() {
            // Create a reference
            let storageRef = storage.reference().child("images")

            // Create a completion handler - aka what the function should do after it listed all the items
            let handler: (StorageListResult, Error?) -> Void = { (result, error) in
                    if let error = error {
                            print("error", error)
            }

            let item = result.items
                    print("item: ", item) // Returns an array of items
            }

            // List the items
            //storageRef.list(maxResults: 1, completion: handler)
    }

}

