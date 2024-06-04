//
//  ReferredViewController.swift
//  opal-ios
//
//  Created by afx on 04/06/2024.
//

import Combine
import Foundation
import UIKit

class SponsorshipViewController: UIViewController {
    
    private let scrollView = UIScrollView()
    private let mainCardView = UIView()
    private let sponsorshipDescriptionLabel = UILabel()
    private let referredCard = UIView()
    private let addFriendsButton = UIButton()
    private let shareReferralLinkButton = UIButton()
    
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
        
    }
    
    private func setUpConstraints() {
        
    }
    
    private func setUpBindings() {
        viewModel.statePublisher.sink(receiveValue: { [weak self] state in
            guard let self = self else { return }
            switch state {
            case .loading:
                print("Show loader")
            case .loaded(let sponsorship):
                print("Make list")
            }
        }).store(in: &cancellable)
        
        viewModel.loadRewards()
    }
}

// MARK: - Convenience Methods

extension SponsorshipViewController {
    
    
}
