//
//  probable_node_swiftuiApp.swift
//  probable-node-swiftui
//
//  Created by m1_air on 8/28/24.
//

import SwiftUI
import SwiftData
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}

@main
struct probable_node_swiftuiApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()
    
    

    var body: some Scene {
        
        @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
