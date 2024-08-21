//
//  TeamModel.swift
//  probable-node
//
//  Created by m1_air on 8/13/24.
//

import Foundation
import Observation

@Observable class TeamMember: Identifiable {
    var id: String
    var role: String
    var name: String
    var image: String
    var description: String
    
    init(id: String, role: String, name: String, image: String, description: String) {
        self.id = id
        self.role = role
        self.name = name
        self.image = image
        self.description = description
    }
}
