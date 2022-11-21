//
//  Order.swift
//  waitumerApp
//
//  Created by Andrey Pochepaev on 21.11.2022.
//

import Foundation

struct Order: Decodable, Identifiable {
    
    var id: Int?
    var description: String?
    var isReady: Bool
    var isArchived: Bool
    
}
