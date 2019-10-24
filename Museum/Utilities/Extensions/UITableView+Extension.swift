//
//  UITableView+Extension.swift
//  Museum
//
//  Created by Naste, Ishwar (US - Bengaluru) on 15/07/19.
//  Copyright © 2019 Naste, Ishwar (US - Bengaluru). All rights reserved.
//

import UIKit

extension UITableView {
    
    public func register<T: UITableViewCell>(_: T.Type, cellName name: String, fromBundle bundle: Bundle? = nil) {
        let nib = UINib(nibName: name, bundle: bundle)
        register(T.self, forCellReuseIdentifier: name)
        register(nib, forCellReuseIdentifier: name)
    }
}
