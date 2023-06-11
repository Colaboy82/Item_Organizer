//
//  HomeTab.swift
//  Item_Organizer
//
//  Created by Derrick Mu on 5/23/23.
//

import SwiftUI

extension UIScreen{
   static let screenWidth = UIScreen.main.bounds.size.width
   static let screenHeight = UIScreen.main.bounds.size.height
   static let screenSize = UIScreen.main.bounds.size
}

struct HomeTab: View {
    
    let data = 1...10
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    var body: some View {
        ZStack{
            Color.gray
                .edgesIgnoringSafeArea(.all)
            //  ACTUAL CONTENT
            ScrollView (.vertical) {
                LazyVGrid(columns: columns, alignment: .center, spacing: 30) {
                    ForEach(data, id: \.self) { item in
                        Button{
                            print(item)
                            Screen_State.hierarchy = "Category"
                            print(Screen_State.hierarchy)
                        }label: {
                            Image(systemName:"\(item).square.fill")
                                .resizable()
                                .font(.system(.title, design: .rounded))
                                .foregroundColor(.white)
                                .fontWeight(.black)
                                .frame(maxWidth: UIScreen.screenWidth/3, minHeight: UIScreen.screenHeight/6)
                        }
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: 700)
//
//            VStack {
//                Text("Set #1 (Test Tile)")
//                    .font(.system(.title, design: .rounded))
//                    .foregroundColor(.black)
//                    .fontWeight(.black)
//            } //VStack
//            .frame(maxWidth: UIScreen.screenWidth/3, minHeight: UIScreen.screenHeight/6)
//            .padding(30)
//            .background(.white)
//            .cornerRadius(20)
            
            //
            Spacer()

        }
    }
}

struct HomeTab_Previews: PreviewProvider {
    static var previews: some View {
        HomeTab()
    }
}
