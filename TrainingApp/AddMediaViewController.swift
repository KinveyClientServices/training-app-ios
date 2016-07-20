//
//  AddMediaViewController.swift
//  TrainingApp
//
//  Created by Vladislav Krasovsky on 4/12/16.
//  Copyright © 2016 Kinvey. All rights reserved.
//

import UIKit
import Kinvey

class AddMediaViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var saveButtonItem: UIBarButtonItem!

    var media: Media?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateSaveButtonState()
    }
    

    func updateSaveButtonState() {
        saveButtonItem.enabled = nameTextField.text?.characters.count > 0
    }
    
    @IBAction func editingChangedForTextField(sender: AnyObject) {
        updateSaveButtonState()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "saveMediaSegueId" {
            media = Media(JSONString: nameTextField.text!)
        }
    }
 
}
