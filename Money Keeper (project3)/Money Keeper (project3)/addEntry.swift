//
//  addEntry.swift
//  Money Keeper (project3)
//
//  Created by Abdullah Alsayari on 11/30/18.
//  Copyright © 2018 Abdullah Alsayari. All rights reserved.
//

import UIKit

class addEntry: UIViewController {

    @IBOutlet weak var nameTF: UITextField!
    
    @IBOutlet weak var amountTF: UITextField!
    
    
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    
    @IBOutlet weak var addButton: UIButton!
    
    @IBOutlet weak var cancelButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        amountLabel.text = NSLocalizedString("amountLabelText", comment: "")
        nameLabel.text = NSLocalizedString("nameLabelText", comment: "")
        addButton.setTitle(NSLocalizedString("addButtonText", comment: ""), for: .normal)
        
        cancelButton.setTitle(NSLocalizedString("cancelButtonText", comment: ""), for: .normal)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func onAddEntry(_ sender: Any) {
        
        let wrongInputAlert = UIAlertController(title: NSLocalizedString("WrongInputAlertTitle", comment: ""), message: NSLocalizedString("WrongInputAlertMessage", comment: ""), preferredStyle: .alert)
        let okayAlertAction = UIAlertAction(title: "Okay", style: .cancel, handler: nil)
        wrongInputAlert.addAction(okayAlertAction)

//         let strAmount  = amountTF.text!
//        else {
//            self.present(wrongInputAlert, animated: true, completion: nil)
//            return
//        }
        
        let emptyInputAlert = UIAlertController(title: NSLocalizedString("emptyInputAlertTitle", comment: ""), message: NSLocalizedString("emptyInputAlertMessage", comment: ""), preferredStyle: .alert)
        
        emptyInputAlert.addAction(okayAlertAction)
        
        if (amountTF.text == "" || nameTF.text == ""){
            self.present(emptyInputAlert, animated: true, completion: nil)
            return
        }
    
        let amount = amountTF.text
        let name = nameTF.text
        
        
        Entry.sharedData.addEntry(amount: amount!, name: name!)
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancel(_ sender: Any) {
        
        let cancelAlertBox = UIAlertController(title: NSLocalizedString("cancelAlertBoxTitle", comment: ""), message: NSLocalizedString("cancelAlertBoxMessage", comment: ""), preferredStyle: .alert)
        
        let yesAlertButton = UIAlertAction(title: NSLocalizedString("yesAlertButton", comment: ""), style: .default, handler:{_ in
            self.presentingViewController?.dismiss(animated: true, completion: nil)
            } )
        
        let noAlertButton = UIAlertAction(title: NSLocalizedString("noAlertButton", comment: ""), style: .cancel, handler: nil)
        
        cancelAlertBox.addAction(yesAlertButton)
        cancelAlertBox.addAction(noAlertButton)
        self.present(cancelAlertBox, animated: true, completion: nil)
        
    }
    
    @IBAction func switchtoblack(_ sender: Any) {
        view.backgroundColor = UIColor.lightGray
    }
    
    @IBAction func switchBack(_ sender: Any) {
        view.backgroundColor = UIColor.brown
    }
    

}
