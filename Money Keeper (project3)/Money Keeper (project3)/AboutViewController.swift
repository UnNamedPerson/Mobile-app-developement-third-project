//
//  AboutViewController.swift
//  Money Keeper (project3)
//
//  Created by Abdullah Alsayari on 11/28/18.
//  Copyright © 2018 Abdullah Alsayari. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController{
    
    @IBOutlet weak var done: UIButton!
    
    @IBOutlet weak var appName: UILabel!
    @IBOutlet weak var Version: UILabel!
    @IBOutlet weak var Build: UILabel!
    @IBOutlet weak var copyRights: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        done.setTitle(NSLocalizedString("doneButton", comment: ""), for: .normal)
        
        appName.text = Bundle.main.appName
        Version.text = Bundle.main.Version
        Build.text = Bundle.main.Build
        copyRights.text = Bundle.main.copyRights
        
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func done(_ sender: Any) {
    presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    


}
