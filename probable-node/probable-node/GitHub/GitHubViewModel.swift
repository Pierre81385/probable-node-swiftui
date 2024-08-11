//
//  GitHubViewModel.swift
//  probable-node
//
//  Created by m1_air on 8/11/24.
//

import Foundation
import Observation

@Observable class GitHubManager {
    var user: GitHubUser = GitHubUser(login: "", id: 0, nodeID: "", avatarURL: "", gravatarID: "", url: "", htmlURL: "", followersURL: "", followingURL: "", gistsURL: "", starredURL: "", subscriptionsURL: "", organizationsURL: "", reposURL: "", eventsURL: "", receivedEventsURL: "", type: "", siteAdmin: false, name: "", company: "", blog: "", location: "", email: "", hireable: false, bio: "", twitterUsername: "", notificationEmail: "", publicRepos: 0, publicGists: 0, followers: 0, following: 0, createdAt: "", updatedAt: "")
    var baseURL: String = "http://127.0.0.1:3000"
    
    func getUser() {

        var request = URLRequest(url: URL(string: "\(baseURL)/github/user")!)
         request.httpMethod = "GET"

         let dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
             if let error = error {
                 print("Request error: ", error)
                 return
             }

             guard let response = response as? HTTPURLResponse else { return }

             if response.statusCode == 200 {
                 guard let data = data else { return }
                 DispatchQueue.main.async {
                     do {
                         self.user = try JSONDecoder().decode(GitHubUser.self, from: data)
                     } catch let error {
                         print("Error decoding: ", error)
                     }
                 }
             }
         }

         dataTask.resume()
     }
}
