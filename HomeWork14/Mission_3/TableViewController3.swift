//
//  TableViewController3.swift
//  HomeWork14
//
//  Created by Yura on 10.01.2022.
//

import UIKit

class TableViewController3:
    UITableViewController, Fantom {
    
    
    @IBOutlet var tableViewM3: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
        Data3.fetchData()
    }



    override func viewDidLoad() {
        super.viewDidLoad()

        tableViewM3.delegate = self
        tableViewM3.dataSource = self
         self.navigationItem.leftBarButtonItem = self.editButtonItem
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Data3.count()
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell3", for: indexPath) as! MyCell3
        cell.setNote(dataStr: Data3[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            Data3.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    func addNewNote(text: String) {
        Data3.append(text)
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dialog_vc = segue.destination as? Dialog_VC {
            dialog_vc.zaheila = self
        }
    }
    
    
}
