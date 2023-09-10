//
//  SetNameModel.swift
//  Item_Organizer
//
//  Created by Derrick Mu on 9/4/23.
//

import Foundation
import Firebase

class SetNameObject: ObservableObject,Identifiable {
    @Published var setName: String
    
    init(name: String) {
        setName = name
    }
}
