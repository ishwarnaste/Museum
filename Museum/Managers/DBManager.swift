//
//  DBManager.swift
//  Museum
//
//  Created by Naste, Ishwar (US - Bengaluru) on 14/07/19.
//  Copyright © 2019 Naste, Ishwar (US - Bengaluru). All rights reserved.
//

import RealmSwift

class DBManager {
    var database: Realm? {
        get {
            do {
                let realm = try Realm()
                realm.refresh()
                return realm
            } catch {
                fatalError("Unable to configure Realm")
            }
        }
    }
    static let sharedInstance = DBManager()
}
