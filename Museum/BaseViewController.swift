//
//  BaseViewController.swift
//  Museum
//
//  Created by Naste, Ishwar (US - Bengaluru) on 15/07/19.
//  Copyright © 2019 Naste, Ishwar (US - Bengaluru). All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    /**
     Handler to be called on sync notification
     
     - parameter notif: Notification object
     */
    @objc func syncCompleted(notif: Notification) {
        performActionOnSyncCompletion()
    }
    
    /**
     Handler to be called on sync notification
     
     - parameter notif: Notification object
     */
    @objc func syncFailed(notif: Notification) {
        performActionOnSyncFailure()
    }


    /**
     Perform action on sync completion
     */
    @objc func performActionOnSyncCompletion() {
        //override this in base class whereever needed
    }
    
    /**
     Perform action on sync completion
     */
    @objc func performActionOnSyncFailure() {
        DispatchQueue.main.async {[weak self] in
            guard let strongSelf = self else {
                return
            }
            let alert = UIAlertController(title: "Error", message: "Error Fetching Data", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            strongSelf.present(alert, animated: true, completion: nil)
        }
    }


    /**
     This function helps in setting up nav bar for Tab bar view controllers.
     */
    func setupNavbar(shouldUseLargeTitles: Bool = false) {
        if shouldUseLargeTitles {
            navigationController?.navigationBar.barTintColor = .white
            navigationController?.navigationBar.prefersLargeTitles = true
            navigationController?.navigationBar.largeTitleTextAttributes =
                [NSAttributedString.Key.foregroundColor: UIColor(red: 0/255.0, green: 0/255.0, blue: 102/255.0, alpha: 1.0),
                 NSAttributedString.Key.font: UIFont(name: "Verdana", size: 34)!,
                 NSAttributedString.Key.kern: 0.4]
            navigationController?.view.backgroundColor = UIColor(red: 243/255.0, green: 244/255.0, blue: 245/255.0, alpha: 1.0)
            navigationController?.navigationBar.isTranslucent = false
            navigationController?.navigationBar.titleTextAttributes =
                [NSAttributedString.Key.foregroundColor: UIColor(red: 0/255.0, green: 0/255.0, blue: 102/255.0, alpha: 1.0),
                 NSAttributedString.Key.font: UIFont(name: "Verdana", size: 18)!,
                 NSAttributedString.Key.kern: -0.4]
        } else {
            navigationController?.navigationBar.barTintColor = UIColor.white
            navigationController?.navigationBar.prefersLargeTitles = false
            navigationController?.view.backgroundColor =  UIColor(red: 243/255.0, green: 244/255.0, blue: 245/255.0, alpha: 1.0)
            navigationController?.navigationBar.isTranslucent = false
            navigationController?.navigationBar.titleTextAttributes =
                [NSAttributedString.Key.foregroundColor: UIColor(red: 23/255.0, green: 42/255.0, blue: 58/255.0, alpha: 1.0),
                 NSAttributedString.Key.font: UIFont(name: "Verdana", size: 18)!,
                 NSAttributedString.Key.kern: -0.4]
        }
    }

    
    /**
     Function to de-register sync notifications
     */
    func deRegisterForSyncNotifications() {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: NotificationIdentifiers.SyncCompleted), object: nil)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: NotificationIdentifiers.SyncFailed), object: nil)
    }
    
    /**
     Function to register for sync notifications
     */
    func registerForSyncNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(syncCompleted(notif:)),
                                               name: NSNotification.Name(rawValue: NotificationIdentifiers.SyncCompleted), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(syncFailed(notif:)),
                                               name: NSNotification.Name(rawValue: NotificationIdentifiers.SyncFailed), object: nil)
    }
}
