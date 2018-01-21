//
//  ViewController2.swift
//  
//
//  Created by Trenton Ropp on 1/20/18.
//

import UIKit

class ViewController2: UIViewController {
    @IBOutlet weak var DogLeft: UIImageView!
    
    @IBOutlet weak var DogRight: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        _ = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(ViewController.sayHello), userInfo: nil, repeats: true)
    }
    
   var j = 0
    @objc func sayHello()
    {
        
        UIView.animate(withDuration: 0.75, delay: 0, options: .curveLinear, animations: {
                // this will change Y position of your imageView center
                // by 1 every time you press button
                self.DogLeft.center.x += 25
                self.DogRight.center.x -= 25
            if (self.j==3){
                self.DogLeft.center.y -= 5
                self.DogRight.center.y += 5
            }
            else if (self.j==1){
                self.DogLeft.center.y += 5
                self.DogRight.center.y -= 5
            }
            if(self.j==5){
                self.j=0
            }
            self.j=self.j+1
            }, completion: nil)
        }
    
        
        
        
        
        // Do any additional setup after loading the view.
    
   
    
    

    
    
    
    
    
    

    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

