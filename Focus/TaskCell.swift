//
//  TaskCell.swift
//  Focus
//
//  Created by Ethan Trac on 5/3/20.
//  Copyright © 2020 Ethan Trac. All rights reserved.
//

import UIKit

protocol ChangeButton {
    func changeButton(checked: Bool, index: Int)
}

class TaskCell: UITableViewCell {
    
    @IBAction func checkBoxAction(_ sender: Any) {
        if(tasks![indexP!].checked) {
            delegate?.changeButton(checked: false, index: indexP!)
        }
        
        else {
            delegate?.changeButton(checked: true, index: indexP!)
        }
    }
    
    @IBOutlet weak var taskDesc: UILabel!
    @IBOutlet weak var taskName: UILabel!
    @IBOutlet weak var checkBox: UIButton!
    
    var delegate: ChangeButton?
    var indexP: Int?
    var tasks: [Task]?
}
