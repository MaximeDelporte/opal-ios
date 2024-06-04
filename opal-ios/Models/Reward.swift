//
//  Reward.swift
//  opal-ios
//
//  Created by afx on 04/06/2024.
//

import Foundation

struct Reward: Decodable {
    
    let imageUrl: String
    let requiredFriends: Int
    let title: String
    let description: String
    let excludePremiums: Bool
    
    enum CodingKeys: String, CodingKey {
        case imageUrl = "image_url"
        case requiredFriends = "required_friends"
        case title
        case description
        case excludePremiums = "exclude_premiums"
    }
}
