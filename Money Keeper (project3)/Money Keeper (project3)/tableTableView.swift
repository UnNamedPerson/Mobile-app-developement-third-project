//
//  tableTableView.swift
//  Money Keeper (project3)
//
//  Created by Abdullah Alsayari on 11/30/18.
//  Copyright © 2018 Abdullah Alsayari. All rights reserved.
//

import UIKit

class tableTableView: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.reloadData()
        
        self.title = NSLocalizedString("tableTitle", comment: "")

    }

    override func viewDidAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Entry.sharedData.EntryList.count
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        Entry.sharedData.deleteEntry(at: indexPath.row)
        self.tableView.reloadData()
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let tableCell = Entry.sharedData.EntryList[indexPath.row]
        cell.textLabel?.text = tableCell.name
        return cell
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailVC" {
            let detailVC = segue.destination as! EntryDetailViewController
            //                detailVC.cellIndex = cellIndex
            if let indexpath = tableView.indexPathForSelectedRow {
                //                detailVC.cell = 3
                detailVC.name_string = Entry.sharedData.EntryList[indexpath.row].name
                detailVC.amount_string = Entry.sharedData.EntryList[indexpath.row].amount
                
            }
        }
    }



}
