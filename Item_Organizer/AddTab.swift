//
//  AddTab.swift
//  Item_Organizer
//
//  Created by Derrick Mu on 5/23/23.
//

import SwiftUI
import FirebaseFirestore
import Firebase

public class Add_Vals {
    static var new_set_name = ""
    static var setNamesArray:[String] = []
}

struct AddTab: View {
    
    @State var Add_Tab_hierarchy_tracker = Screen_State.hierarchy

    @State var new_set_name_text_field: String = ""
        
    @State var set_names_list: [SetNameObject] = []
    
    var body: some View {
        if Screen_State.hierarchy == "Set"{
                    
            ZStack(alignment: .top){
                Color.gray
                    .edgesIgnoringSafeArea(.all)
                VStack(){
                    HStack(){
                        Spacer()
                        Text("Set:").font(.system(size: 25, weight: .bold, design: .rounded))
                        VStack{
                            TextField("Type To Create New Set", text: $new_set_name_text_field)
                                .disableAutocorrection(true)
                                .autocapitalization(.none)
                        }.textFieldStyle(.roundedBorder)
                        Spacer()
                    }
                    VStack {
                        ForEach((self.set_names_list), id: \.self.setName) { item in
                            Text("\(item.setName)")
                            //probably need to convert into scrollable list eventually
                        }
                    }.onAppear() {
                        self.fetchAllSetNames()
                    }
                }
                let _ = Add_Vals.new_set_name = new_set_name_text_field
                
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
    
    func checkNewSetName(new_set_name: String){
        // checks for duplicate setNames
        //MAY NOT BE NECESSARY
    }
    
    func addNewSetName(new_set_name: String){
        let db = Firestore.firestore()
        let file_title = UID.curr_User_ID + "_SetNames"
        db.collection(file_title).document(new_set_name).setData(["Name": new_set_name])
    }
  
    func fetchAllSetNames() {
        let db = Firestore.firestore()
        let file_title = UID.curr_User_ID + "_SetNames"
        
        // Remove previously data to prevent duplicate data
        self.set_names_list.removeAll()
        db.collectionGroup(file_title).getDocuments() {(querySnapshot, err) in
            if let err = err {
                print("Error getting documents \(err)")
            } else {
                for document in querySnapshot!.documents {
                    let set_name = document.get("Name") as! String
                    self.set_names_list.append(SetNameObject(name: set_name))
                }
            }
        }
    }
    
}



struct AddTab_Previews: PreviewProvider {
    static var previews: some View {
        AddTab()
    }
}



