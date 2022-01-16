//
//  MyCell.swift
//  HomeWork14
//
//  Created by Yura on 07.01.2022.
//

import UIKit

class MyCell3: UITableViewCell {

    @IBOutlet weak var lblWhatToDo: UILabel!
    
    func setNote(dataStr: String) {
        lblWhatToDo.text = dataStr
    }

}
