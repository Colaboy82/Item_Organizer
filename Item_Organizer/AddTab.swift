//
//  AddTab.swift
//  Item_Organizer
//
//  Created by Derrick Mu on 5/23/23.
//

import SwiftUI

struct AddTab: View {
    
    @State var Add_Tab_hierarchy_tracker = Screen_State.hierarchy

    var body: some View {
        if Screen_State.hierarchy == "Set"{
            ZStack{
                Color.gray
                    .edgesIgnoringSafeArea(.all)
                Text("Add Tab (set)").font(.system(size: 30, weight: .bold, design: .rounded))
                
            }
        }else if Screen_State.hierarchy == "Category"{
            ZStack{
                Color.gray
                    .edgesIgnoringSafeArea(.all)
                Text("Add Tab (category)").font(.system(size: 30, weight: .bold, design: .rounded))
            }
        }else{ //item
                    
        }
    }
}

struct AddTab_Previews: PreviewProvider {
    static var previews: some View {
        AddTab()
    }
}
