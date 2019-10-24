//
//  CollectionViewModel.swift
//  Museum
//
//  Created by Naste, Ishwar (US - Bengaluru) on 14/07/19.
//  Copyright © 2019 Naste, Ishwar (US - Bengaluru). All rights reserved.
//

import Foundation


struct CollectionViewModel: CollectionManagementProtocol {
    
    // MARK: - Variables

    var collections = [Collection]()

    mutating func loadCollection() {
        if let collectionsObjects = getCollections() {
            self.collections = collectionsObjects
        }
    }
    
}
