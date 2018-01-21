//
//  ViewController3.swift
//  HangryApp
//
//  Created by Trenton Ropp on 1/20/18.
//  Copyright © 2018 Trenton and Lauren. All rights reserved.
//

import UIKit
import GooglePlaces
import Alamofire
class ViewController3: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        GMSPlacesClient.provideAPIKey("AIzaSyAl0uLA40l0ICxJthsTvB7vGWfpWPFFdIw")
        findPlacesNearMe()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func findPlacesNearMe() {
        
        let parameters: Parameters = [
            "key": "AIzaSyAl0uLA40l0ICxJthsTvB7vGWfpWPFFdIw",
            "location": "29.6516,82.3248",
            "radius": "500",
        ]
        
        Alamofire.request("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=26,82&rankby=distance&types=food&key=AIzaSyAl0uLA40l0ICxJthsTvB7vGWfpWPFFdIw").responseString { response in
            debugPrint(response)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
