//
//  AddTab.swift
//  Item_Organizer
//
//  Created by Derrick Mu on 5/23/23.
//

import SwiftUI

struct AddTab: View {
    var body: some View {
        ZStack{
            Color.gray
                .edgesIgnoringSafeArea(.all)
            Text("Add Tab").font(.system(size: 30, weight: .bold, design: .rounded))
        }
    }
}

struct AddTab_Previews: PreviewProvider {
    static var previews: some View {
        AddTab()
    }
}
