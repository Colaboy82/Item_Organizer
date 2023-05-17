//
//  ContentView.swift
//  Item_Organizer
//
//  Created by Derrick Mu on 5/15/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            HStack (spacing: 20){
                Image(systemName: "house.fill")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
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
            TabView {
                Text("Home Tab").tabItem {
                Image(systemName: "house.fill")
                Text("Main Menu")
                }
                Text("Add Tab")
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem {
                Image(systemName: "plus.diamond.fill")
                    Text("Add")
                }
                Text("Edit Tab")
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem {
                Image(systemName: "pencil")
                    Text("Edit")
                }
            }
        }.padding()
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
