//
//  UIImageView+Extension.swift
//  Museum
//
//  Created by Naste, Ishwar (US - Bengaluru) on 15/07/19.
//  Copyright © 2019 Naste, Ishwar (US - Bengaluru). All rights reserved.
//

import UIKit
import Kingfisher

extension UIImageView {
    
    func downloadImageFrom(urlString: String) {
        self.kf.indicatorType = .activity
        
//         Image download is failing due to certificate issue. I am passing hardcoded value here to show the implementation works but failing due to invalid certification
//        Image downloader in my case is failing due to firewall settings on my system. To test the implementaion I have used below image
//        The certificate for this server is invalid. You might be connecting to a server that is pretending to be “lh3.googleusercontent.com” which could put your confidential information at risk.
        
//        Please uncomment below line to test with sample url
//        let url = URL(string: "https://images.pexels.com/photos/67636/rose-blue-flower-rose-blooms-67636.jpeg?cs=srgb&dl=beauty-bloom-blue-67636.jpg&fm=jpg")
    
        let url = URL(string: urlString)
        self.kf.setImage(with: url)
    }
}
