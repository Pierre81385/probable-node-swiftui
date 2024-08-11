//
//  GitStats.swift
//  probable-node
//
//  Created by m1_air on 8/11/24.
//

import SwiftUI

struct GitStats: View {
    @State var ghManager: GitHubManager = GitHubManager()
    
    var body: some View {
        VStack{
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/).onAppear{
                ghManager.getUser()
            }
            Text(ghManager.user.login)
        }
    }
}

#Preview {
    GitStats()
}
