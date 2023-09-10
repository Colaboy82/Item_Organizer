//
//  HomeTab.swift
//  Item_Organizer
//
//  Created by Derrick Mu on 5/23/23.
//

import SwiftUI
import FirebaseFirestore

extension UIScreen{
   static let screenWidth = UIScreen.main.bounds.size.width
   static let screenHeight = UIScreen.main.bounds.size.height
   static let screenSize = UIScreen.main.bounds.size
}

struct HomeTab: View {
    
    let data = (1...10).map { "Set #\($0)" }
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    @State var set_names_list: [SetNameObject] = []
        
    var body: some View {
        ZStack{
            Color.gray
                .edgesIgnoringSafeArea(.all)
            //  Set Content
            ScrollView (.vertical) {
                LazyVGrid(columns: columns, alignment: .center, spacing: 30) {
                    ForEach(self.set_names_list, id: \.self.setName) { item in
                        Button{
                            print("\(item.setName)")
                            Screen_State.hierarchy = "Category"
                            print(Screen_State.hierarchy)
                        }label: {
                            Text("\(item.setName)")
                                .font(.system(.title, design: .rounded))
                                .foregroundColor(.black)
                                .fontWeight(.black)
                                .frame(maxWidth: UIScreen.screenWidth/3, minHeight: UIScreen.screenHeight/6)
                                .padding(20)
                                .background(.white)
                                .cornerRadius(40)
                        }
                    }
                }
            }.onAppear() {
                self.fetchAllSetNames()
            }
            .frame(maxWidth: .infinity, maxHeight: 700)

            //
            Spacer()

        }
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

struct HomeTab_Previews: PreviewProvider {
    static var previews: some View {
        HomeTab()
    }
}
