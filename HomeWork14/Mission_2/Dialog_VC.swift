//
//  Dialog_VC.swift
//  HomeWork14
//
//  Created by Yura on 08.01.2022.
//

import UIKit

class Dialog_VC: UIViewController {
    
    var zaheila: Fantom? = nil

    @IBOutlet weak var txtField: UITextField!
    
    @IBAction func btnAddPushed(_ sender: Any) {
        if txtField.text != "" {
            zaheila?.addNewNote(text: txtField.text!)
            dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func btnCancelPushed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }

}
