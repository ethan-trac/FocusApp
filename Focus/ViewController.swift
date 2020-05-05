//
//  ViewController.swift
//  Focus
//
//  Created by Ethan Trac on 5/3/20.
//  Copyright © 2020 Ethan Trac. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, AddTask, ChangeButton {
    
    
    
    var tasks: [Task] = []
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var table: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        date.text = DateFormatter.localizedString(from: NSDate() as Date, dateStyle: DateFormatter.Style.medium, timeStyle: DateFormatter.Style.none)
        
        
    }
    
    //# of rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    //change rows
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //this is a TaskCell that was created in the TaskCell.swift
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath) as! TaskCell
        
        //set task name
        cell.taskName.text = tasks[indexPath.row].name
        cell.taskDesc.text = tasks[indexPath.row].desc
        
        //set check box image
        if(tasks[indexPath.row].checked) {
            cell.checkBox.setBackgroundImage(#imageLiteral(resourceName: "checkBoxFILLED "), for: UIControl.State.normal)
        }
        
        else {
            cell.checkBox.setBackgroundImage(#imageLiteral(resourceName: "checkBoxOUTLINE "), for: UIControl.State.normal)
        }
        
        
        cell.delegate = self
        cell.indexP = indexPath.row
        cell.tasks = tasks

        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! AddTaskController
        vc.delegate = self
    }
    
    //adds task to the list of tasks
    func addTask(name: String, desc: String) {
        tasks.append(Task(name: name, desc: desc))
        table.reloadData()
    }
    
    func changeButton(checked: Bool, index: Int) {
        tasks[index].checked = checked
        table.reloadData()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

class Task {
    var name = ""
    var desc = ""
    var checked = false
    
    convenience init(name: String, desc: String) {
        self.init()
        self.name = name
        self.desc = desc
    }
    
    
}

