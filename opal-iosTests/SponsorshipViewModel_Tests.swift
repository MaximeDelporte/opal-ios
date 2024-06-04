//
//  opal_iosTests.swift
//  opal-iosTests
//
//  Created by afx on 04/06/2024.
//

import XCTest
@testable import opal_ios

final class SponsorshipViewModel_Tests: XCTestCase {
    
    func test_reward_properties() {
        let reward = Reward(
            imageUrl: "loyal-gem",
            requiredFriends: 1,
            title: "Loyal Gem",
            description: "Unlock this special milestone",
            isPremiumReward: false
        )
            
        XCTAssertEqual(reward.imageUrl, "loyal-gem")
        XCTAssertEqual(reward.requiredFriends, 1)
        XCTAssertEqual(reward.title, "Loyal Gem")
        XCTAssertEqual(reward.description, "Unlock this special milestone")
        XCTAssertEqual(reward.isPremiumReward, false)
    }
}
