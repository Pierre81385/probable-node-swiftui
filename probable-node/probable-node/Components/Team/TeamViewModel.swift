//
//  TeamViewModel.swift
//  probable-node
//
//  Created by m1_air on 8/13/24.
//

import Foundation
import Observation

@Observable class TeamViewModel {
    var members: [TeamMember]
    var member: TeamMember
    
    init(members: [TeamMember], member: TeamMember) {
        self.members = members
        self.member = member
    }
    
    func getTeamMembers() {
        
    }
}
