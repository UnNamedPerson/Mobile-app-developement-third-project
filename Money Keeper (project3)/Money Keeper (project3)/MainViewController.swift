//
//  MainViewController.swift
//  Money Keeper (project3)
//
//  Created by Abdullah Alsayari on 12/3/18.
//  Copyright © 2018 Abdullah Alsayari. All rights reserved.
//

import UIKit
import CoreLocation

class MainViewController: UIViewController, CLLocationManagerDelegate  {
    
    let defaults = UserDefaults(suiteName: defaultID)!
    
    @IBOutlet weak var lastDate: UILabel!
    
    @IBOutlet weak var numberOfLaunches: UILabel!
    
    
    @IBOutlet weak var tableButton: UIButton!
    
    @IBOutlet weak var webButton: UIButton!
    
    @IBOutlet weak var getCurrentLocationButton: UIButton!
    
    @IBOutlet weak var EndCurrentLocationButton: UIButton!
    
    @IBOutlet weak var locationLable: UILabel!
    
    var locationManager: CLLocationManager!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        numberOfLaunches.text = defaults.integer(forKey: numberLaunches).description
        
        lastDate.text = defaults.string(forKey: dTime)?.description
        
    tableButton.setTitle(NSLocalizedString("tableButtonText", comment: ""), for: .normal)
       
        locationLable.text = NSLocalizedString("locationLabelText", comment: "")
    webButton.setTitle(NSLocalizedString("webButtonText", comment: ""), for: .normal)
        
        getCurrentLocationButton.setTitle(NSLocalizedString("getCurrentLocationButtonText", comment: ""), for: .normal)
        
        EndCurrentLocationButton.setTitle(NSLocalizedString("endCurrentLocationButton", comment: ""), for: .normal)
        
        locationManager = CLLocationManager()
        locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
        locationManager.distanceFilter = 10
        
        locationManager.delegate = self

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locationList: [CLLocation]) {
        for location in locationList {
            print("got location")
            let coordinate = location.coordinate
            locationLable.text = coordinate.latitude.description
            
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error:Error){
        print("there was an error getting a location: \(error.localizedDescription)")

        let errorAlert = UIAlertController(title: "error", message: "There was an error getting the location of type: \(error.localizedDescription)" , preferredStyle: .alert)

        let okayAlertAction = UIAlertAction(title: "Okay", style: .cancel, handler: nil)

        errorAlert.addAction(okayAlertAction)
        present(errorAlert, animated: true)
    }
    
    
//    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
//        print("Error getting location: " + error.localizedDescription)
//    }
    
    func noPermission(title:String, message:String){
        
        let alertBox = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        
        let okAlertAction = UIAlertAction(title: "ok", style: .cancel, handler: nil)
        let settingAlertAction = UIAlertAction(title: "setting", style: .default, handler:{ _ in
            UIApplication.shared.open( URL(string: UIApplicationOpenSettingsURLString)!)
            
        })
        alertBox.addAction(okAlertAction)
        alertBox.addAction(settingAlertAction)
        present(alertBox, animated: true)
    }
    
    @IBAction func onGetCurrentLocation(_ sender: Any) {
            switch CLLocationManager.authorizationStatus() {
            case .denied:
                noPermission(title: "Denied", message: "service denied")
            case .restricted:
                noPermission(title: "restricted", message: "service is restricted")
           
            default:
        locationManager.requestWhenInUseAuthorization()
            locationManager.startUpdatingLocation()
            }
    }

    @IBAction func onEndGettingLocation(_ sender: Any) {
        locationManager.stopUpdatingLocation()
            locationLable.text = NSLocalizedString("locationLabelText", comment: "")
    }
    


}
