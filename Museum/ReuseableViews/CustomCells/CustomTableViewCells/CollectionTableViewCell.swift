//
//  CollectionTableViewCell.swift
//  Museum
//
//  Created by Naste, Ishwar (US - Bengaluru) on 15/07/19.
//  Copyright © 2019 Naste, Ishwar (US - Bengaluru). All rights reserved.
//

import UIKit

class CollectionTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionsContentView: UIView!
    @IBOutlet weak var imageContentView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        collectionsContentView.applyShadow(withOpacity: 0.3,
                                      color: .blue,
                                      offset: CGSize(width: 0, height: 1),
                                      andRadius: 1.5)
        collectionsContentView.roundCorners([.layerMinXMinYCorner, .layerMaxXMinYCorner,
                                        .layerMaxXMaxYCorner, .layerMinXMaxYCorner],
                                       radius: 6,
                                       clipToBounds: false)

    }

    func configureCollection(collectionDetails: Collection) {
        self.titleLabel.text = collectionDetails.collectionTitle
        if let imageURL = collectionDetails.collectionImageURL {
            self.imageContentView.downloadImageFrom(urlString: imageURL)
        }
    }
}
