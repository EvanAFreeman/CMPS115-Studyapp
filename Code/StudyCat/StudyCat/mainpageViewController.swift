//
//  mainPage.swift
//  StudyCat
//
//  Created by Camille Rogers on 11/27/18.
//  Copyright © 2018 Kit. All rights reserved.
//

import UIKit
import AVFoundation

class mainpageViewController: UIViewController{

    
    
    //Used for the second views menu, deals with the constraint of the menus location and hides it offscreen when the menu button is pressed
    @IBOutlet weak var leadingConstraint2: NSLayoutConstraint!
    
    var menuShow = true
    @IBAction func menuView2(_ sender: Any) {
        if (menuShow){
            leadingConstraint2.constant = -67
            UIView.animate(withDuration: 0.3, animations: {
                self.view.layoutIfNeeded()
            })
        } else{
            leadingConstraint2.constant = 17
            
            UIView.animate(withDuration: 0.3, animations: {
                self.view.layoutIfNeeded()
            })
            view.layoutIfNeeded()
        }
        menuShow = !menuShow
    }
    
    //Used for the fifth views menu, deals with the constraint of the menus location and hides it offscreen when the menu button is pressed
    @IBOutlet weak var leadingConstraint5: NSLayoutConstraint!
    
    @IBAction func menuView5(_ sender: Any) {
        if (menuShow){
            leadingConstraint5.constant = -67
            UIView.animate(withDuration: 0.3, animations: {
                self.view.layoutIfNeeded()
            })
        } else{
            leadingConstraint5.constant = 17
            
            UIView.animate(withDuration: 0.3, animations: {
                self.view.layoutIfNeeded()
            })
            view.layoutIfNeeded()
        }
        menuShow = !menuShow
    }
    
    
    
    @IBOutlet weak var book_cat: UIImageView!
    var book1: UIImage!
    var book2: UIImage!
    var book3: UIImage!
    var book4: UIImage!
    var book5: UIImage!
    var book6: UIImage!
    var book7: UIImage!
    var book8: UIImage!
    var book9: UIImage!
    
    var images13: [UIImage]!
    var animatedImage13: UIImage!
    
    override func viewDidLoad() {
    book1 = UIImage(named: "book_1")
    book2 = UIImage(named: "book_2")
    book3 = UIImage(named: "book_3")
    book4 = UIImage(named: "book_4")
    book5 = UIImage(named: "book_5")
    book6 = UIImage(named: "book_6")
    book7 = UIImage(named: "book_7")
    book8 = UIImage(named: "book_8")
    book9 = UIImage(named: "book_9")
    
    images13 = [book1, book2, book3, book4, book5, book6, book7, book8, book9]
    
    animatedImage13 = UIImage.animatedImage(with: images13, duration: 2.0)
    if book_cat != nil {
    book_cat.image = animatedImage13
    }
}
}
