//
//  ViewController.swift
//  HomeWork14
//
//  Created by Yura on 06.01.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtFirstName: UITextField!
    @IBOutlet weak var txtSecondName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let x = UserDefaults.standard.string(forKey: "firstName") {
            txtFirstName.text = x
        }
        
        if let y = UserDefaults.standard.string(forKey: "secondName") {
            txtSecondName.text = y
        }
    }

    @IBAction func btnSavePushed(_ sender: Any) {
        UserDefaults.standard.set(txtFirstName.text, forKey: "firstName")
        UserDefaults.standard.set(txtSecondName.text, forKey: "secondName")
    }
}

