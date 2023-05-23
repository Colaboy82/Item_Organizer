//
//  HomeTab.swift
//  Item_Organizer
//
//  Created by Derrick Mu on 5/23/23.
//

import SwiftUI

struct HomeTab: View {
    var body: some View {
        ZStack{
            Color.gray
                .edgesIgnoringSafeArea(.all)
            Text("Home Tab").font(.system(size: 30, weight: .bold, design: .rounded))
        }
    }
}

struct HomeTab_Previews: PreviewProvider {
    static var previews: some View {
        HomeTab()
    }
}
