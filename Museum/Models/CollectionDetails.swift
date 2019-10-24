//
//  CollectionDetails.swift
//  Museum
//
//  Created by Naste, Ishwar (US - Bengaluru) on 13/07/19.
//  Copyright © 2019 Naste, Ishwar (US - Bengaluru). All rights reserved.
//

import Foundation

/// This struct is used to store details of the artist collection.
struct CollectionDetails {
    let collectionId: String
    let collectionObjectNumber: String
    let collectionTitle: String
    let collectionLongTitle: String
    let collectionImageURL: String
}

extension CollectionDetails {
    init(json: [String: Any]) throws {

        guard let collectionId = json[CollectionDetailsKeys.collectionID] as? String else {
            throw SerializationError.missing("Missing :: collectionId")
        }
        
        guard let collectionObjectNumber = json[CollectionDetailsKeys.collectionObjectNumber] as? String else {
            throw SerializationError.missing("Missing :: collectionObjectNumber")
        }

        guard let collectionTitle = json[CollectionDetailsKeys.collectionTitle] as? String else {
            throw SerializationError.missing("Missing :: collectionTitle")
        }

        guard let collectionLongTitle = json[CollectionDetailsKeys.collectionLongTitle] as? String else {
            throw SerializationError.missing("Missing :: collectionLongTitle")
        }
        
        guard let headerImage = json[CollectionDetailsKeys.collectionHeaderImage] as? [String: Any] else {
            throw SerializationError.missing("Missing :: headerImage")
        }

        guard let collectionImageURL = headerImage[CollectionDetailsKeys.collectionHeaderImageURL] as? String else {
            throw SerializationError.missing("Missing :: collectionImageURL")
        }

        self.collectionId = collectionId
        self.collectionObjectNumber = collectionObjectNumber
        self.collectionTitle = collectionTitle
        self.collectionLongTitle = collectionLongTitle
        self.collectionImageURL = collectionImageURL
    }
}
