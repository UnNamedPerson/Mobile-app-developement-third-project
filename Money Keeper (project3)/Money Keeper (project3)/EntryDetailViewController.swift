//
//  EntryDetailViewController.swift
//  Money Keeper (project3)
//
//  Created by Abdullah Alsayari on 11/28/18.
//  Copyright © 2018 Abdullah Alsayari. All rights reserved.
//

import UIKit

class EntryDetailViewController: UIViewController {

    
    @IBOutlet weak var amount: UILabel!
    @IBOutlet weak var name: UILabel!
    
    var name_string:String = ""
    var amount_string : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        amount.text = amount_string
        name.text = name_string
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    

}
