//
//  AgendaViewController.swift
//  Museum
//
//  Created by Naste, Ishwar (US - Bengaluru) on 12/07/19.
//  Copyright © 2019 Naste, Ishwar (US - Bengaluru). All rights reserved.
//

import UIKit

class AgendaViewController: BaseViewController {

    // MARK:- Varables
    @IBOutlet weak var eventsTableView: UITableView!
    
    var viewModel = AgendaViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        registerNibs()
        self.title = "Agenda"
        setupNavbar(shouldUseLargeTitles: true)
        reloadUI()
    }
    
    func registerNibs() {
        eventsTableView.register(EventDetailsTableViewCell.self, cellName: String.init(describing: EventDetailsTableViewCell.self))
    }
    
    func reloadUI() {
        let lastFetchedDate: Date? = UserDefaults.standard.object(forKey: UserDefaultsConstant.lastFetchedDate) as? Date
        if let lastFetchedDate = lastFetchedDate,
            lastFetchedDate < Date().startHourOfDate {
            viewModel.fetchUpcomingWeeksEvents()
        } else if lastFetchedDate == nil {
            viewModel.fetchUpcomingWeeksEvents()
        } else {
            viewModel.loadEvents()
            if viewModel.events.count > 0 {
                eventsTableView.reloadData()
            }
        }
    }
    
    override func performActionOnSyncCompletion() {
        DispatchQueue.main.async { [weak self] in
            guard let strongSelf = self else {
                return
            }
            strongSelf.viewModel.loadEvents()
            strongSelf.eventsTableView.reloadData()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        registerForSyncNotifications()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        deRegisterForSyncNotifications()
    }
}

extension AgendaViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.events.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "EventDetailsTableViewCell", for: indexPath) as? EventDetailsTableViewCell else { return UITableViewCell() }
        let eventDetail = viewModel.events[indexPath.row]
        cell.configure(with: eventDetail)
        return cell
    }
    
    
}

