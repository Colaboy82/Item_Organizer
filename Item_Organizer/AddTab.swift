//
//  AddTab.swift
//  Item_Organizer
//
//  Created by Derrick Mu on 5/23/23.
//

import SwiftUI
import FirebaseFirestore

public class Add_Vals {
    static var new_set_name = ""
    static var setNamesArray:[String] = []
}

struct AddTab: View {
    
    @State var Add_Tab_hierarchy_tracker = Screen_State.hierarchy

    @State var new_set_name_text_field: String = ""
        
    //@EnvironmentObject var addObsObj: AddingData

    var body: some View {
        if Screen_State.hierarchy == "Set"{
        
            var set_names_Arr = fetchAllSetNames()
            
            ZStack(alignment: .top){
                Color.gray
                    .edgesIgnoringSafeArea(.all)
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
                let _ = Add_Vals.new_set_name = new_set_name_text_field
//                List(set_names_list) { String in
//                    VStack(alignment: .leading){
//                        Text("Set_Example_1")
//                    }
//                }
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


    func fetchAllSetNames() -> Array<String>{
        
        let db = Firestore.firestore()
        let file_title = UID.curr_User_ID + "_SetNames"
        
        
        db.collection(file_title).getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    Add_Vals.setNamesArray.append(document.documentID)
                }
            }
        }
        print(Add_Vals.setNamesArray)
        return Add_Vals.setNamesArray
    }
    
}



struct AddTab_Previews: PreviewProvider {
    static var previews: some View {
        AddTab()
    }
}



