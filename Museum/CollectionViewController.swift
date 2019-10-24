//
//  CollectionViewController.swift
//  Museum
//
//  Created by Naste, Ishwar (US - Bengaluru) on 12/07/19.
//  Copyright © 2019 Naste, Ishwar (US - Bengaluru). All rights reserved.
//

import UIKit

class CollectionViewController: BaseViewController {
    
    // MARK:- Varables

    @IBOutlet weak var collectionsTableView: UITableView!
    
    /// CollectionViewModel
    var viewModel = CollectionViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "Collections"
        setupNavbar(shouldUseLargeTitles: true)
        viewModel.fetchCollections(query: "Rembrandt")
        registerNibs()
        reloadUI()
    }
    
    func registerNibs() {
        collectionsTableView.register(CollectionTableViewCell.self, cellName: String.init(describing: CollectionTableViewCell.self))
    }
    
    func reloadUI() {
        viewModel.loadCollection()
        if viewModel.collections.count > 0 {
            collectionsTableView.reloadData()
        } else {
            registerForSyncNotifications()
        }
    }

    
    override func performActionOnSyncCompletion() {
        DispatchQueue.main.async { [weak self] in
            guard let strongSelf = self else {
                return
            }
            strongSelf.viewModel.loadCollection()
            strongSelf.collectionsTableView.reloadData()
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        deRegisterForSyncNotifications()
    }
    
}

extension CollectionViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.collections.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CollectionTableViewCell", for: indexPath) as? CollectionTableViewCell else { return UITableViewCell() }
        let collectionDetails = viewModel.collections[indexPath.row]
        cell.configureCollection(collectionDetails: collectionDetails)
        return cell
    }
    
    
}

