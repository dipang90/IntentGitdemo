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
}
