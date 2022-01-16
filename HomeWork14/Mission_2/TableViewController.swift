//
//  TableViewController.swift
//  HomeWork14
//
//  Created by Yura on 07.01.2022.
//

import UIKit

class TableViewController: UITableViewController, Fantom {
    
    @IBOutlet var tableViewM2: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewM2.delegate = self
        tableViewM2.dataSource = self
         self.navigationItem.leftBarButtonItem = self.editButtonItem
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Data.count()
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyCell
        cell.setNote(data: Data[indexPath.row])

        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            Data.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    func addNewNote(text: String) {
        let note = Note()
        note.noteMessage = text
        Data.append(newElement: note)
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dialog_vc = segue.destination as? Dialog_VC {
            dialog_vc.zaheila = self
        }
    }
    
}

protocol Fantom {
    func addNewNote(text: String)
}
