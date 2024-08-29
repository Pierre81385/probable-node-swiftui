//
//  ContentView.swift
//  probable-node-swiftui
//
//  Created by m1_air on 8/28/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]

    var body: some View {
        VStack{
            Text("Hello, World! With Socket.io")
        }.onAppear{
            SocketService.shared.socket.connect()
        }
    }

}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
