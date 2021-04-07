//
//  BirthdayCell.swift
//  Birthday Tracker
//
//  Created by Dmitriy Lee on 9/24/20.
//  Copyright © 2020 LEES Entertainment. All rights reserved.
//

import UIKit


class BirthdayCell: UITableViewCell {

    @IBOutlet weak var birthdayTitle: UILabel!
    @IBOutlet weak var birthdaySubtitle: UILabel!
    @IBOutlet weak var daysLeftLabel: UILabel!
    
    
    func initCell(birthday: Birthday?) {
        birthdayTitle.text = (birthday?.firstName)! + " " + (birthday?.lastName)!
        birthdaySubtitle.text = birthday?.birthdateString
        daysLeftLabel.text = birthday?.dayLeft
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
