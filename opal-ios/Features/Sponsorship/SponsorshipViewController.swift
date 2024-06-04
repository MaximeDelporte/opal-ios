//
//  ReferredViewController.swift
//  opal-ios
//
//  Created by afx on 04/06/2024.
//

import Combine
import Foundation
import SnapKit
import UIKit

class SponsorshipViewController: UIViewController {
    
    private let scrollView = UIScrollView()
    
    // Guest Pass view
    private let guestPassView = UIView()
    private let guestPassTitleImageView = UIImageView()
    private let guestPassDescriptionLabel = UILabel()
    
    private let sponsorshipDescriptionLabel = UILabel()
    private let referredCard = UIView()
    private let addFriendsButton = UIButton()
    private let shareReferralLinkButton = UIButton()
    
    private var rewardCards = [RewardCard]()
    
    private var cancellable = Set<AnyCancellable>()
    private let viewModel = SponsorshipViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
        setUpConstraints()
        setUpBindings()
    }
}

// MARK: - Common Methods

extension SponsorshipViewController {
    
    private func setUpViews() {
        view.backgroundColor = .black
        view.addSubview(scrollView)
        
        guestPassView.backgroundColor = .purple
        guestPassView.layer.cornerRadius = 16
        guestPassTitleImageView.image = UIImage(named: "opal-title")
        guestPassDescriptionLabel.text = "30-day Guest Pass"
        guestPassDescriptionLabel.font = .systemFont(ofSize: 12, weight: .semibold)
        guestPassDescriptionLabel.textColor = .white.withAlphaComponent(0.9)
        
        sponsorshipDescriptionLabel.text = "Give a friend unlimited access to Opal Pro, including unlimited schedules, app limits, deep focus, whitelisting and more!"
        sponsorshipDescriptionLabel.font = .systemFont(ofSize: 16, weight: .regular)
        sponsorshipDescriptionLabel.textColor = .white
        sponsorshipDescriptionLabel.textAlignment = .center
        sponsorshipDescriptionLabel.numberOfLines = 0
        
        guestPassView.addSubview(guestPassTitleImageView)
        guestPassView.addSubview(guestPassDescriptionLabel)
        
        scrollView.addSubview(guestPassView)
        scrollView.addSubview(sponsorshipDescriptionLabel)
    }
    
    private func setUpConstraints() {
        scrollView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        guestPassView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(16)
            $0.left.equalTo(view).offset(16)
            $0.right.equalTo(view).offset(-16)
        }
        
        guestPassTitleImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(64)
            $0.centerX.equalToSuperview()
        }
        
        guestPassDescriptionLabel.snp.makeConstraints {
            $0.top.equalTo(guestPassTitleImageView.snp.bottom).offset(8)
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().offset(-64)
        }
        
        sponsorshipDescriptionLabel.snp.makeConstraints {
            $0.top.equalTo(guestPassView.snp.bottom).offset(32)
            $0.left.right.equalTo(guestPassView)
        }
    }
    
    private func setUpBindings() {
        viewModel.statePublisher.sink(receiveValue: { [weak self] state in
            guard let self = self else { return }
            switch state {
            case .loading:
                print("Show loader")
            case .loaded(let sponsorship):
                self.addCards(from: sponsorship.rewards)
            }
        }).store(in: &cancellable)
        
        viewModel.loadRewards()
    }
}

// MARK: - Convenience Methods

extension SponsorshipViewController {
    
    private func addCards(from rewards: [Reward]) {
        for reward in rewards {
            let rewardCard = RewardCard(reward: reward)
            rewardCards.append(rewardCard)
        }
        
        setUpRewardCardsConstraints()
    }
    
    private func setUpRewardCardsConstraints() {
        for (index, rewardCard) in rewardCards.enumerated() {
            scrollView.addSubview(rewardCard)
            
            let isFirstCard = index == 0
            
            if isFirstCard {
                rewardCard.snp.makeConstraints {
                    $0.top.equalTo(sponsorshipDescriptionLabel.snp.bottom).offset(32)
                    $0.left.right.equalTo(guestPassView)
                }
            } 
            else {
                let isLastCard = index == rewardCards.count - 1
                let previousCard = rewardCards[index - 1]
                
                if isLastCard {
                    rewardCard.snp.makeConstraints {
                        $0.top.equalTo(previousCard.snp.bottom).offset(16)
                        $0.left.right.equalTo(guestPassView)
                        $0.bottom.equalToSuperview().offset(-32)
                    }
                } else {
                    rewardCard.snp.makeConstraints {
                        $0.top.equalTo(previousCard.snp.bottom).offset(16)
                        $0.left.right.equalTo(guestPassView)
                    }
                }
            }
        }
    }
}
