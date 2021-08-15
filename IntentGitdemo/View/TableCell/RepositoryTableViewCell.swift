//
//  RepositoryTableViewCell.swift
//  IntentGitdemo
//
//  Created by Dipang Sheth on 8/14/21.
//

import UIKit

class RepositoryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var datelabel: IntentLabel!
    @IBOutlet weak var watchLabel: UILabel!
    @IBOutlet weak var starLabel: UILabel!
    @IBOutlet weak var forkLabel: UILabel!
    @IBOutlet weak var languageLabel: IntentLabel!
    @IBOutlet weak var nameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func didSetRepositoryData(obj : RepositoryItem) {
        
        self.nameLabel.text = obj.fullName
        if let language = obj.language {
            self.languageLabel.text = "  " + language + "  "
        }
        if let date = obj.createdAt {
            let createdDate = DateUtility.UTCtoLocalDateNow(string: date)
            self.datelabel.text = createdDate
        }
        if let watch = obj.watchersCount {
            self.watchLabel.text = self.calculateCountInThousandFormat(Countstring: watch)
        }
        if let star = obj.stargazersCount {
            self.starLabel.text = self.calculateCountInThousandFormat(Countstring: star)
        }
        if let fork = obj.forksCount {
            self.forkLabel.text = self.calculateCountInThousandFormat(Countstring: fork)
        }
    }
    
    
    func calculateCountInThousandFormat(Countstring : Int) -> String {
        let count = Double(Countstring)
        return count > 1000 ? String(count/1000) + "K" : String(Countstring)
    }
}
