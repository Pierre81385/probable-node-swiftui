//
//  Item.swift
//  probable-node
//
//  Created by m1_air on 8/10/24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
