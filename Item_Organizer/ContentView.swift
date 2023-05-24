//
//  ContentView.swift
//  Item_Organizer
//
//  Created by Derrick Mu on 5/15/23.
//

import SwiftUI

struct ContentView: View {

    @State private var selection = 0
//    @State private var bckgnd_clr = Color.gray

    var body: some View {
        ZStack{
            Color.gray
                .edgesIgnoringSafeArea(.all)
            VStack {
                Spacer().frame(height: 10)
                HStack (spacing: 20){
                    Spacer().frame(width: 5)
                    Button{
                        self.selection = 0
                    } label: {
                        Image(systemName: "house.fill")
                            .imageScale(.large)
                            .foregroundColor(.accentColor)
                    }
                    Text(header_bar_text(tab_Num: selection))
                    Spacer()
                    Button{
                        print("Search")
                    } label: {
                        Image(systemName: "magnifyingglass")
                            .imageScale(.large)
                            .foregroundColor(.accentColor)
                    }
                    Spacer().frame(width: 5)
                }
                Divider()
                //ACTUAL CONTENT
                
                
                //
                TabView (selection: $selection) {
                    Group {
                        HomeTab()
                            .tabItem {
                                Image(systemName: "house.fill")
                                Text("Main Menu")
                            }
                            .tag(0)
                        
                        AddTab()
                            .tabItem {
                                Image(systemName: "plus.diamond.fill")
                                Text("Add")
                            }
                            .tag(1)
                        
                        EditTab()
                            .tabItem {
                                Image(systemName: "pencil")
                                Text("Edit")
                                
                            }
                            .tag(2)
                    }
                }
                .accentColor(.white)
                .onAppear() {
                    UITabBar.appearance().backgroundColor = .lightGray
//                    UITabBar.appearance().layer.borderColor = UIColor(red:222/255, green:225/255, blue:227/255, alpha: 1).cgColor
//                    UITabBarItem.appearance().titlePositionAdjustment = UIOffset(horizontal: 0, vertical: 10)
                }
                
            }
        }
    }
    
    func header_bar_text(tab_Num: Int) -> String {
        if tab_Num == 2{
            return "Edit"
        }else if tab_Num == 1{
            return "Add"
        }else{
            return "Main Menu"
        }
    }
    
    func tile_cell(name: String) -> some View {
           HStack {
               VStack(alignment: .leading) {
                   Text(name)
                       .font(.caption)
                       .fontWeight(.semibold)
               }
               Spacer()
           }
           .frame(maxWidth: .infinity)
           .padding(20)
           .background(Color.gray)
           .cornerRadius(10)
           .padding(10)
       }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
