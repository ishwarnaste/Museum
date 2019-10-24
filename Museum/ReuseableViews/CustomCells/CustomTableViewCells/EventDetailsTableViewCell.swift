//
//  EventDetailsTableViewCell.swift
//  Museum
//
//  Created by Naste, Ishwar (US - Bengaluru) on 13/07/19.
//  Copyright © 2019 Naste, Ishwar (US - Bengaluru). All rights reserved.
//

import UIKit

class EventDetailsTableViewCell: UITableViewCell {

    @IBOutlet weak var eventsContentView: UIView!
    @IBOutlet weak var eventName: UILabel!
    @IBOutlet weak var eventDescription: UILabel!
    @IBOutlet weak var eventPrice: UILabel!
    @IBOutlet weak var eventTiming: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        eventsContentView.applyShadow(withOpacity: 0.3,
                                           color: .blue,
                                           offset: CGSize(width: 0, height: 1),
                                           andRadius: 1.5)
        eventsContentView.roundCorners([.layerMinXMinYCorner, .layerMaxXMinYCorner,
                                             .layerMaxXMaxYCorner, .layerMinXMaxYCorner],
                                            radius: 6,
                                            clipToBounds: false)
    }
    
    public func configure(with eventDetails: Event) {
        self.eventName.text = eventDetails.name
        self.eventDescription.text = eventDetails.eventDescription
        if let eventPricing = eventDetails.price {
            self.eventPrice.text = "Price : " + eventPricing
        }
        if let displayDate = eventDetails.date?.stringForFormat(DateFormat.monthDateYearShort),
            let eventTiming = eventDetails.timing {
            self.eventTiming.text = displayDate + StringLiteral.singleSpaceString + eventTiming
        }
    }
}
