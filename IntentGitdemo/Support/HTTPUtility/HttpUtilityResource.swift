//
//  HttpUtilityResource.swift
//  IntentGitdemo
//
//  Created by Dipang Sheth on 8/14/21.
//

import Foundation



struct HttpUtilityResource {
    
    static func urls(_ requestName : String) -> URL
    {
        let request = "\(Header.APIDOMAIN)\(requestName)"
        guard let url = URL(string: request.encode()) else {
            return URL(string: "")!
        }
        debugPrint(url)
        return url
    }
}


extension String {
    func encode() -> String {
        return self.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) ?? ""
    }
}
