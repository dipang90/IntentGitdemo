//
//  String+Extension.swift
//  IntentGitdemo
//
//  Created by Dipang Sheth on 8/15/21.
//

import Foundation

extension String {
    func encode() -> String {
        return self.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) ?? ""
    }
    
    func base64Decoded() -> String {
        guard let data = Data(base64Encoded: self) else { return "" }
        return String(data: data, encoding: .utf8) ?? ""
    }
    
    func replace(old string: String, withString: String) -> String {
        return self.replacingOccurrences(of: string, with: withString)
    }
    
    func contains(s: String) -> Bool {
        return (self.range(of: s) != nil) ? true : false
    }
    
}
