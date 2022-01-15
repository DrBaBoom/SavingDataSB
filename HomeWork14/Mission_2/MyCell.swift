//
//  MyCell.swift
//  HomeWork14
//
//  Created by Yura on 07.01.2022.
//

import UIKit

class MyCell: UITableViewCell {

    @IBOutlet weak var lblWhatToDo: UILabel!
    
    
    func setNote(data: Note) {
        lblWhatToDo.text = data.noteMessage
    }

}
