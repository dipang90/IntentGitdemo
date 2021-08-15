//
//  DateUtility.swift
//  IntentGitdemo
//
//  Created by Dipang Sheth on 8/14/21.
//

import Foundation

struct DateUtility {
    static var formate = "yyyy-MM-dd"
    static var timeZone = ""
    static var locale = ""
    static let calendar = Calendar.current
    static let dateFormate = DateUtility.dateFormatter()
    
    //MARK: - DateFormater
    static func dateFormatter(formate : String = "yyyy-MM-dd") -> DateFormatter {
        let formatter : DateFormatter  = DateFormatter()
        formatter.dateFormat = formate
        formatter.timeZone = TimeZone.current
        formatter.locale = Locale.current
        if !DateUtility.timeZone.isEmpty {
            formatter.timeZone = TimeZone(identifier: DateUtility.timeZone)
        }
        if !DateUtility.locale.isEmpty {
            formatter.locale = Locale(identifier: DateUtility.locale)
        }
        return formatter
    }
    
    //MARK: - Date & String
    static func stringFromDate(_ date : Date, format : String = formate ) -> String {
        return dateFormatter(formate: format).string(from: date)
    }
    static func dateFromString(_ string : String, format : String = formate) -> Date {
        let date = dateFormatter(formate: format).date(from: string)
        if date != nil {
            let somedateString = dateFormate.string(from: date!)
            return dateFormate.date(from: somedateString)!
        }
        return Date()
    }

    static func UTCtoLocalDate(string : String, formate : String = "MMM dd, yyyy") -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss-SSSS"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        guard let date = dateFormatter.date(from: string) else {
            return string
        }
        return stringFromDate(date, format: formate)
    }
    
    static func differenceDate(_ value : Int, date : Date) -> String {
        let addedDate = Calendar.current.date(byAdding: .day, value: value, to:date)
        let serviceDate = DateUtility.stringFromDate(addedDate!)
        return serviceDate
    }
    //      "created_at" : "2020-10-30T09:29:35+0000",
    //      "policy_signed_at" : "2020-10-30T09:29:36.189222Z",
    //2012-12-03T11:36:20Z
    
    static func UTCtoLocalDateNow(string : String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        guard let date = dateFormatter.date(from: string) else {
            return string
        }
        return stringFromDate(date, format: "MMM dd, yyyy")
    }
}
