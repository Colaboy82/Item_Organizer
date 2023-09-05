//
//  SetNameModel.swift
//  Item_Organizer
//
//  Created by Derrick Mu on 9/4/23.
//

import Foundation
import Firebase

struct SetNameModel: Identifiable {
    var id: String = UUID().uuidString
    var SetNames: String?
}
