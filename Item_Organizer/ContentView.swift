//
//  ContentView.swift
//  Item_Organizer
//
//  Created by Derrick Mu on 5/15/23.
//

import SwiftUI

struct ContentView: View {

    @State private var selection = 0

    var body: some View {
        ZStack{
            Color.gray
                .edgesIgnoringSafeArea(.all)
            VStack {
                HStack (spacing: 20){
                    Button{
                        print("Hello World Main Menu")
                    } label: {
                        Image(systemName: "house.fill")
                            .imageScale(.large)
                            .foregroundColor(.accentColor)
                    }
                    Text("Main Menu")
                    Spacer()
                    Button{
                        print("Hello World Test")
                    } label: {
                        Image(systemName: "magnifyingglass")
                            .imageScale(.large)
                            .foregroundColor(.accentColor)
                    }
                }
                Divider()
                
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
 
                }
            }
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
