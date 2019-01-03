//
//  WebViewController.swift
//  Money Keeper (project3)
//
//  Created by Abdullah Alsayari on 12/2/18.
//  Copyright © 2018 Abdullah Alsayari. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {
    
    let defaults = UserDefaults(suiteName: defaultID)!

    
    let url = URL(string: "https://unsplash.com/photos/Ph5_4TnXXYE/download?force=true")
    
    @IBOutlet weak var webImage: UIImageView!
    
    let urlSession : URLSession = {
        let config = URLSessionConfiguration.default
        return URLSession(configuration: config)
    }()

    func loadImage(imageurl: URL){
        URLSession.shared.dataTask(with: imageurl) { (data, reponse, error) in
            if(error != nil){
                print("there was an error getting the image")
            }
            
            DispatchQueue.main.async {
                self.webImage.image = UIImage(data: data!)
            }
            
        }.resume()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        loadImage(imageurl: url!)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    



}
