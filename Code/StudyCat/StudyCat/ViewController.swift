//
//  ViewController.swift
//  StudyCat
//
//  Created by C_Martin on 10/13/18.
//  Copyright © 2018 Kit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var leadingConstraint1: NSLayoutConstraint!
    @IBOutlet weak var leadingConstraint2: NSLayoutConstraint!
    @IBOutlet weak var leadingConstraint3: NSLayoutConstraint!
    @IBOutlet weak var leadingConstraint4: NSLayoutConstraint!
    @IBOutlet weak var leadingConstraint5: NSLayoutConstraint!
    @IBOutlet weak var leadingConstraint6: NSLayoutConstraint!
    
    @IBOutlet weak var leadConstraint1: NSLayoutConstraint!
    
    @IBOutlet weak var leadConstraint2: NSLayoutConstraint!
    
    @IBOutlet weak var leadConstraint3: NSLayoutConstraint!
    
    @IBOutlet weak var leadConstraint4: NSLayoutConstraint!
    
    @IBOutlet weak var leadConstraint5: NSLayoutConstraint!
    
    @IBOutlet weak var leadConstraint6: NSLayoutConstraint!
    
    
    
    
    var menuShow = true
    
    @IBAction func menu1(_ sender: Any) {
        if (menuShow){
            leadConstraint1.constant = -67
            UIView.animate(withDuration: 0.3, animations: {
                self.view.layoutIfNeeded()
            })
        } else{
            leadConstraint1.constant = 8
        
            UIView.animate(withDuration: 0.3, animations: {
                self.view.layoutIfNeeded()
            })
            view.layoutIfNeeded()
        }
        menuShow = !menuShow
    }
    
    
    @IBAction func menu2(_ sender: Any) {
        if (menuShow){
            leadConstraint2.constant = -67
            UIView.animate(withDuration: 0.3, animations: {
                self.view.layoutIfNeeded()
            })
        } else{
            leadConstraint2.constant = 8
            
            UIView.animate(withDuration: 0.3, animations: {
                self.view.layoutIfNeeded()
            })
            view.layoutIfNeeded()
        }
        menuShow = !menuShow
    }
    
    
    @IBAction func menu3(_ sender: Any) {
        if (menuShow){
            leadConstraint3.constant = -67
            UIView.animate(withDuration: 0.3, animations: {
                self.view.layoutIfNeeded()
            })
        } else{
            leadConstraint3.constant = 8
            
            UIView.animate(withDuration: 0.3, animations: {
                self.view.layoutIfNeeded()
            })
            view.layoutIfNeeded()
        }
        menuShow = !menuShow
    }
    
    
    @IBAction func menu4(_ sender: Any) {
        if (menuShow){
            leadConstraint4.constant = -67
            UIView.animate(withDuration: 0.3, animations: {
                self.view.layoutIfNeeded()
            })
        } else{
            leadConstraint4.constant = 8
            
            UIView.animate(withDuration: 0.3, animations: {
                self.view.layoutIfNeeded()
            })
            view.layoutIfNeeded()
        }
        menuShow = !menuShow
    }
    
    
    
    @IBAction func menu5(_ sender: Any) {
        if (menuShow){
            leadConstraint5.constant = -67
            UIView.animate(withDuration: 0.3, animations: {
                self.view.layoutIfNeeded()
            })
        } else{
            leadConstraint5.constant = 8
            
            UIView.animate(withDuration: 0.3, animations: {
                self.view.layoutIfNeeded()
            })
            view.layoutIfNeeded()
        }
        menuShow = !menuShow
    }
    
    
    @IBAction func menu6(_ sender: Any) {
        if (menuShow){
            leadConstraint6.constant = -67
            UIView.animate(withDuration: 0.3, animations: {
                self.view.layoutIfNeeded()
            })
        } else{
            leadConstraint6.constant = 8
            
            UIView.animate(withDuration: 0.3, animations: {
                self.view.layoutIfNeeded()
            })
            view.layoutIfNeeded()
        }
        menuShow = !menuShow
    }
    
    
    @IBOutlet weak var menu1: UIBarButtonItem!
    
    @IBOutlet weak var cat_in_box: UIImageView!
    var box: UIImage!
    var box1: UIImage!
    var box2: UIImage!
    var box3: UIImage!
    var box4: UIImage!
    var box5: UIImage!
    
    var images: [UIImage]!
    
    var animatedImage: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        box1 = UIImage(named: "box_1")
        box2 = UIImage(named: "box_2")
        box3 = UIImage(named: "box_3")
        box4 = UIImage(named: "box_4")
        box5 = UIImage(named: "box_5")
        
        images = [box1, box2, box3, box4, box5]
        
   
        animatedImage = UIImage.animatedImage(with: images, duration: 1.0)
        if cat_in_box != nil {
            cat_in_box.image = animatedImage
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

