//
//  DataRequest.swift
//  Museum
//
//  Created by Naste, Ishwar (US - Bengaluru) on 13/07/19.
//  Copyright © 2019 Naste, Ishwar (US - Bengaluru). All rights reserved.
//

import Foundation
import SwiftyJSON

class DataRequest {
    
    static func execute(dataRequest: NetworkRequestConvertible, success: @escaping((Any) -> Void), failure: @escaping ((Error) -> ())) {

        if let url = URL.init(string: dataRequest.urlString) {
            let dataTask = URLSession.shared.dataTask(with: url) { (data, urlResponse, error) in
                do {
                    if let data = data{
                        let json = try JSON(data: data, options: [])
                        success(json)
                    } else {
                        failure(error ?? NSError.init(domain: "Parse Error", code: 0, userInfo: nil))
                    }
                }
                catch {
                    print("Error reading JSON")
                }
            }
            dataTask.resume()
        }
    }
}
