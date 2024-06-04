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
    
    func test_sponsorship_properties() {
        let reward = Reward(
            imageUrl: "loyal-gem",
            requiredFriends: 1,
            title: "Loyal Gem",
            description: "Unlock this special milestone",
            isPremiumReward: false
        )
        
        let sponsorship = Sponsorship(referredFriends: 0, rewards: [reward])
        
        XCTAssertEqual(sponsorship.referredFriends, 0)
        
        let firstReward = sponsorship.reward[0]
        XCTAssertEqual(firstReward.imageUrl, "loyal-gem")
        XCTAssertEqual(firstReward.requiredFriends, 1)
        XCTAssertEqual(firstReward.title, "Loyal Gem")
        XCTAssertEqual(firstReward.description, "Unlock this special milestone")
        XCTAssertEqual(firstReward.isPremiumReward, false)
    }
    
    func test_whenSponsorshipRequestIsSuccessful_thenWeShouldHaveProperties() {
        let viewModel = SponsorshipViewModel()
//        sponsorship = viewModel.loadRewards()
//        XCTAssertEqual(sponsorship.rewards, 7)
    }
}
