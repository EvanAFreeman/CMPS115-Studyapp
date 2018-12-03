//
//  Cat.swift
//  StudyCat
//
//  Created by C_Martin on 11/23/18.
//  Copyright © 2018 Kit. All rights reserved.
//

import Foundation
import UIKit

class Cat {
    var images: Array<UIImage>
    var name: String
    var colorManip: Double //for changing hue of cat?
    
    init() {
        self.images = [UIImage()]
        self.name = "Noname"
        self.colorManip = 0.0
    }
    
    func addImages(imgArray: Array<UIImage>) {
        self.images = imgArray
    }
    
    func getImages() -> Array<UIImage> {
        return self.images
    }
    
    func setColor(colorManip: Double) {
        self.colorManip = colorManip
    }
    
    
}
