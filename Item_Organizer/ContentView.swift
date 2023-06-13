//
//  ContentView.swift
//  Item_Organizer
//
//  Created by Derrick Mu on 5/15/23.
//

import SwiftUI


public class Screen_State {
    //Set, Category, Item
    static var hierarchy = "Set"
//    init() {
//        Screen_State.hierarchy = "Set"
//    }
}

struct ContentView: View {

    @State private var selection = 0
//    @State private var bckgnd_clr = Color.gray

    var body: some View {
        
        ZStack{
            Color.gray
                .edgesIgnoringSafeArea(.all)
            VStack {
                Spacer().frame(height: 10)
                build_header_bar()
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
    
    func build_header_bar() -> some View{
            return AnyView(
                HStack (spacing: 20){
                    Spacer().frame(width: 5)
                    header_bar_left_btn(tab_Num: selection)
                    Text(header_bar_text(tab_Num: selection))
                    Spacer()
                    header_bar_right_btn(tab_Num: selection)
                    Spacer().frame(width: 5)
                })
        
    }

    
    func header_bar_text(tab_Num: Int) -> String {
        if tab_Num == 2{
            return "Edit"
        }else if tab_Num == 1{
            if Screen_State.hierarchy == "Set"{
                return "New Set Entry"
            }else{
                return "New Item Entry"
            }
        }else{
            Screen_State.hierarchy = "Set"
            return "Main Menu"
        }
    }
    
    func header_bar_left_btn(tab_Num: Int) -> some View{
        if tab_Num == 0{
            return AnyView(Button{
                self.selection = 0
                Screen_State.hierarchy = "Set"
                print(Screen_State.hierarchy)
            } label: {
                Image(systemName: "house.fill")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
            })
        }else if tab_Num == 1{
            return AnyView(Button{
                self.selection = 0
                print("Cancel/Back")
            } label: {
                Image(systemName: "xmark")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
            })
        }else{
            return AnyView(Button{
                self.selection = 0
                print("Cancel/Back")
            } label: {
                Image(systemName: "xmark")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
            })
        }
    }
    
    func header_bar_right_btn(tab_Num: Int) -> some View{
        if tab_Num == 0{
            return AnyView(Button{
                print("Search")
            } label: {
                Image(systemName: "magnifyingglass")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
            })
        }else if tab_Num == 1{
            return AnyView(Button{
                print("Save Set")
            } label: {
                Image(systemName: "checkmark")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
            })
        }else{
            return AnyView(Button{
                print("Save Set")
            } label: {
                Image(systemName: "checkmark")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
            })
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
