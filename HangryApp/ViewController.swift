//
//  ViewController.swift
//  HangryApp
//
//  Created by Trenton Ropp on 1/19/18.
//  Copyright © 2018 Trenton and Lauren. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var timer = Timer()
    
    
    @IBOutlet weak var GradBack2: UIImageView!
    @IBOutlet weak var Mic1: UIImageView!
    @IBOutlet weak var NowListening: UIImageView!
    @IBOutlet weak var ListeningHolder: UIView!
    @IBOutlet weak var GradBack1: UIImageView!
    @IBOutlet weak var PowerButton: UIButton!
    @IBOutlet weak var ImFeeling: UIImageView!
    @IBOutlet weak var Logo: UIImageView!
    @IBOutlet weak var Mic2: UIImageView!
    @IBOutlet weak var Mic3: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @IBAction func PowerButton(_ sender: Any) {
        ListeningHolder.isHidden = false
        GradBack1.isHidden = true
        PowerButton.isHidden = true
        ImFeeling.isHidden = true
        Logo.isHidden = true
        _ = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.sayHello), userInfo: nil, repeats: true)
        }
    
    var i = 1;
    @objc func sayHello()
    {
        if(i==1){
        self.Mic1.isHidden = false
        self.Mic2.isHidden = true
        self.Mic3.isHidden = true
        }
            
        else if (i==2){
            self.Mic1.isHidden = true
            self.Mic2.isHidden = false
            self.Mic3.isHidden = true
        }
        else {
            self.Mic1.isHidden = true
            self.Mic2.isHidden = true
            self.Mic3.isHidden = false
        }
        i = i + 1
        if(i==4){
            i=1
        }
    }
   


    
   
}
