//
//  ItemCell.swift
//  Hamechiz
//
//  Created by Abed on 17/01/2017.
//  Copyright © 2017 Webiaturist. All rights reserved.
//

import UIKit

class ActivityCell: UITableViewCell {

    @IBOutlet weak var thumb: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var sets: UILabel!
    @IBOutlet weak var repss: UILabel!
   
    
    func configureCell(activity: Activity){
        
        let coolDate = activity.date
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, MMMM dd"
        let resultDate = formatter.string(from: coolDate as! Date)
        
        thumb.image = UIImage(named: activity.type!)
        title.text = activity.type
        date.text = resultDate
        sets.text = activity.sets
        repss.text = activity.reps
        
    }

}
