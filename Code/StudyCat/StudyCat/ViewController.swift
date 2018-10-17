//
//  ViewController.swift
//  StudyCat
//
//  Created by C_Martin on 10/13/18.
//  Copyright © 2018 Kit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
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
        
        cat_in_box.image = animatedImage
        
  
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

