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
    book1 = UIImage(named: "book_0")
    book2 = UIImage(named: "book_1")
    book3 = UIImage(named: "book_2")
    book4 = UIImage(named: "book_3")
    book5 = UIImage(named: "book_4")
    book6 = UIImage(named: "book_5")
    book7 = UIImage(named: "book_6")
    book8 = UIImage(named: "book_7")
    book9 = UIImage(named: "book_8")
    
    images13 = [book1, book2, book3, book4, book5, book6, book7, book8, book9]
    
    animatedImage13 = UIImage.animatedImage(with: images13, duration: 2.0)
    if book_cat != nil {
    book_cat.image = animatedImage13
    }
}
}
