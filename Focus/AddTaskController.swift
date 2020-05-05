//
//  AddTaskController.swift
//  Focus
//
//  Created by Ethan Trac on 5/3/20.
//  Copyright © 2020 Ethan Trac. All rights reserved.
//

import UIKit

protocol AddTask {
    func addTask(name: String, desc: String)
}

class AddTaskController: UIViewController, UITextFieldDelegate {
    
    @IBAction func addAction(_ sender: Any) {
        if(taskName.text != "") {
            delegate?.addTask(name: taskName.text!, desc: taskDesc.text!)
            navigationController?.popViewController(animated: true)
            
            dismiss(animated: true, completion: nil)
        }
    }
    
    @IBOutlet weak var taskName: UITextField!
    @IBOutlet weak var taskDesc: UITextField!
    
    var delegate: AddTask?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.taskName.delegate = self
        self.taskDesc.delegate = self
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
