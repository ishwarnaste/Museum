//
//  MuseumObject.swift
//  Museum
//
//  Created by Naste, Ishwar (US - Bengaluru) on 14/07/19.
//  Copyright © 2019 Naste, Ishwar (US - Bengaluru). All rights reserved.
//

import Foundation
import RealmSwift

open class MuseumObject:Object {
    
    /**
     - returns: Return true if operation completed successfully, false otherwise.
     */
    @discardableResult
    public func save() -> Bool {
        
        guard let realmDB = DBManager.sharedInstance.database else {
            return false
        }
        do {
            realmDB.beginWrite()
            realmDB.add(self)
            try realmDB.commitWrite()
            return true
            
        } catch {
            return false
        }
    }
    
    class public func deleteAll() {
        let realm = try! Realm()
        try! realm.write {
            realm.deleteAll()
        }
    }

}
