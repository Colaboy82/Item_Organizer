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
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world! Commit Test, Testign Derrick Branch")
            TabView {
                Text("Home Tab").tabItem {
                Image(systemName: "house.fill")
                Text("Main Menu")
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
