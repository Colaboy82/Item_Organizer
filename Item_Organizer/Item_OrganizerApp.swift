//
//  Item_OrganizerApp.swift
//  Item_Organizer
//
//  Created by Derrick Mu on 5/15/23.
//

import SwiftUI
import FirebaseCore
import FirebaseAuth

@main
struct Item_OrganizerApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            let viewModel = AppViewModel()
            FirstView()
                .environmentObject(viewModel)
        }
    }
    
}

class AppDelegate: NSObject, UIApplicationDelegate{
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
            
        return true
    }
}
 
