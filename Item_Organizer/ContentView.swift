//
//  ContentView.swift
//  Item_Organizer
//
//  Created by Mitchell Mu on 5/16/23.
//

import SwiftUI

struct ContentView: View {
    @State private var searchText = ""
    @State private var isSearchExpanded = false
    
    var body: some View {
        NavigationView {
            VStack {
                if isSearchExpanded {
                    SearchBar(text: $searchText, isExpanded: $isSearchExpanded)
                }
                
                Divider() // Horizontal line
                
                Text("Searching for \(searchText)")
                    .padding()
                
                Spacer()
            }
            .navigationBarItems(
                leading: leadingNavigationBarItem,
                trailing: trailingNavigationBarItem
            )
        }
    }
    
    var leadingNavigationBarItem: some View {
        if !isSearchExpanded {
            return AnyView(
                Button(action: {
                    // Home button action
                }) {
                    Image(systemName: "house.fill")
                }
            )
        } else {
            return AnyView(EmptyView())
        }
    }
    
    var trailingNavigationBarItem: some View {
        if !isSearchExpanded {
            return AnyView(
                Button(action: {
                    isSearchExpanded.toggle()
                }) {
                    Image(systemName: "magnifyingglass")
                }
            )
        } else {
            return AnyView(EmptyView())
        }
    }
}

struct SearchBar: View {
    @Binding var text: String
    @Binding var isExpanded: Bool
    
    var body: some View {
        HStack {
            TextField("Search", text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button(action: {
                isExpanded.toggle()
            }) {
                Text("Cancel")
            }
            .padding(.leading, 8)
        }
        .padding(.horizontal)
    }
}





// MARK: --- This is the Preview Section ---
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
