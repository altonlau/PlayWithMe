//
//  SettingsViewController.swift
//  PlayWithMe
//
//  Created by Stephen Lee on 7/24/19.
//  Copyright © 2019 Yelp Inc. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.text = "John Doe"
        sportsTextField.text = "Tennis"
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var nameTextField: UITextField!

    @IBOutlet weak var sportsTextField: UITextField!
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
