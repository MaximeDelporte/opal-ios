//
//  SponsorshipViewModel.swift
//  opal-ios
//
//  Created by afx on 04/06/2024.
//

import Foundation

class SponsorshipViewModel {
    
    func loadRewards() -> Sponsorship {
        let sponsorship = Bundle.main.decode(Sponsorship.self, from: "sponsorship.json")
        return sponsorship
    }
}
