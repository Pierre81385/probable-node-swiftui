//
//  probable_nodeApp.swift
//  probable-node
//
//  Created by m1_air on 8/10/24.
//

import SwiftUI
import SwiftData
import AWSCore
import Foundation

private var accessKey: String {
  get {
    // 1
    guard let filePath = Bundle.main.path(forResource: "AWS", ofType: "plist") else {
      fatalError("Couldn't find file 'AWS.plist'.")
    }
    // 2
    let plist = NSDictionary(contentsOfFile: filePath)
    guard let value = plist?.object(forKey: "ACCESS_KEY") as? String else {
      fatalError("Couldn't find key 'ACCESS_KEY' in 'AWS.plist'.")
    }
    return value
  }
}

private var secretKey: String {
  get {
    // 1
    guard let filePath = Bundle.main.path(forResource: "AWS", ofType: "plist") else {
      fatalError("Couldn't find file 'AWS.plist'.")
    }
    // 2
    let plist = NSDictionary(contentsOfFile: filePath)
    guard let value = plist?.object(forKey: "SECRET_KEY") as? String else {
      fatalError("Couldn't find key 'SECRET_KEY' in 'AWS.plist'.")
    }
    return value
  }
}

@main
struct probable_nodeApp: App {
    
    init(){
        let credentialsProvider = AWSStaticCredentialsProvider(accessKey: accessKey, secretKey: secretKey)
        let configuration = AWSServiceConfiguration(region: .USEast1, credentialsProvider: credentialsProvider)
        AWSServiceManager.default().defaultServiceConfiguration = configuration
        print(AWSServiceManager.default().description)
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
        WindowGroup {
            ImageRekognition()
        }
        .modelContainer(sharedModelContainer)
    }
}
