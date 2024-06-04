//
//  opal_iosTests.swift
//  opal-iosTests
//
//  Created by afx on 04/06/2024.
//

import XCTest
@testable import opal_ios

final class SponsorshipViewModel_Tests: XCTestCase {
    
    func test_sponsorship_properties() {
        let reward = Reward(
            imageUrl: "loyal-gem",
            requiredFriends: 1,
            title: "Loyal Gem",
            description: "Unlock this special milestone",
            excludePremiums: false
        )
        
        let sponsorship = Sponsorship(referredFriends: 0, rewards: [reward])
        
        XCTAssertEqual(sponsorship.referredFriends, 0)
        
        let firstReward = sponsorship.rewards[0]
        XCTAssertEqual(firstReward.imageUrl, "loyal-gem")
        XCTAssertEqual(firstReward.requiredFriends, 1)
        XCTAssertEqual(firstReward.title, "Loyal Gem")
        XCTAssertEqual(firstReward.description, "Unlock this special milestone")
        XCTAssertEqual(firstReward.excludePremiums, false)
    }
    
    func test_whenSponsorshipRequestIsSuccessful_thenWeShouldHaveProperties() {
        let viewModel = SponsorshipViewModel()
        let sponsorship = viewModel.loadRewards()
        XCTAssertEqual(sponsorship.rewards.count, 6)
    }
}
