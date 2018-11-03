//
//  ViewController.swift
//  StudyCat
//
//  Created by C_Martin on 10/13/18.
//  Copyright © 2018 Kit. All rights reserved.
//

import UIKit
import Firebase
import FirebaseStorage
import FirebaseDatabase

class ViewController: UIViewController {

 
    @IBOutlet weak var cat_in_box: UIImageView!
    var box: UIImage!
    var box1: UIImage!
    var box2: UIImage!
    var box3: UIImage!
    var box4: UIImage!
    var box5: UIImage!
    
    
    
    
    var images: [UIImage]!
    let storage = Storage.storage().reference()
    let database = Database.database().reference()
    
    var animatedImage: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //let bundleIdentifier =  Bundle.main.bundleIdentifier
        //print(bundleIdentifier!)
        let metaData = StorageMetadata()
        metaData.contentType = "image/jpeg"
        
        images = loadCatBox()
        
        /*
        box1 = UIImage(named: "box_1")
        box2 = UIImage(named: "box_2")
        box3 = UIImage(named: "box_3")
        box4 = UIImage(named: "box_4")
        box5 = UIImage(named: "box_5")
 
        
        images = [box1, box2, box3, box4, box5]
 
    
        for (index, image) in images.enumerated() {
            //print(String(format: "image number %d\n", index))
            let temp = storage.child(String(format: "cat_pictures/box_%d", index+1))
            
            temp.putData(UIImageJPEGRepresentation(image, 0.8)!, metadata: metaData) { (data, error) in
                if error == nil {
                    print("upload successful")
                } else {
                    print("error")
                }
            }
            
        }
         */
 
        
   
        animatedImage = UIImage.animatedImage(with: images, duration: 1.0)
        if cat_in_box != nil {
            cat_in_box.image = animatedImage
        }
    }
    
    /*
    func uploadImage(filename: String) {
        let temp = storage.child(String(format: "cat_pictures/box_%d", index))
        temp.putData(UIImageJPEGRepresentation(image, 0.8)!, metadata: metaData) { (data, error) in
            if error == nil {
                print("upload successful")
            } else {
                print("error")
            }
        }

    }
     */

    func loadCatBox() -> Array<UIImage>{
        
        var images = Array<UIImage>()
        
        for i in 1...5 {
            let temp = storage.child(String(format: "cat_pictures/box_%d", i))
            temp.getData(maxSize: 1*1000*1000) { (data, error) in
                if error == nil {
                    print(String(format: "pic %d retreived successfully\n", i))
                } else {
                    print(String(format: "there was an error loading the cat %d\n", i))
                }
            }
            
            images.append(UIImage(named: String(format: "box_%d", i))!)
        }
        return images
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
//Timer Implementation
////////////////////////////////////////////////////////////////////////////////////
    var seconds = 0
    var timer = Timer()
    var minutes = 0
    var hours = 0
    var timer_running = false
    var resume = false
    var time_sec = 0
    
    @IBOutlet weak var timer_label: UILabel!
    
    @IBOutlet weak var slider_outlet: UISlider!
    @IBAction func slider_timer(_ sender: UISlider) {
        time_sec = Int(sender.value)
        timer_label.text = timeString(time: TimeInterval(time_sec))
        
    }
    
    @IBOutlet weak var progress_timer: UIProgressView!
    
    @IBOutlet weak var start_outlet: UIButton!
    @IBAction func start_button(_ sender: UIButton) {
        if(timer_running == false){
            run_timer()
        }
    }
    
    func run_timer(){
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.counter), userInfo: nil, repeats: true)
        timer_running = true
    }
    
    func counter(){
        if(time_sec > 0){
            time_sec -= 1
            timer_label.text = timeString(time: TimeInterval(time_sec))
        }
        else{
            timer.invalidate()
        }
    }
    
    @IBOutlet weak var pause_outlet: UIButton!
    @IBAction func pause_button(_ sender: UIButton) {
        if (self.resume == false){
            timer.invalidate()
            self.resume = true
            self.pause_outlet.setTitle("Resume",for: .normal)
        }
        else{
            run_timer()
            self.resume = false
            self.pause_outlet.setTitle("Pause",for: .normal)
        }
    }
    
    @IBOutlet weak var reset_outlet: UIButton!
    @IBAction func reset_button(_ sender: UIButton) {
        timer_running = false
        timer.invalidate()
        time_sec = 0
        timer_label.text = timeString(time: TimeInterval(time_sec))
        slider_outlet.setValue(0, animated: true)
    }
    
    @IBOutlet weak var cat: UIImageView!
    func timeString(time:TimeInterval) -> String{
        hours = Int(time) / 3600
        minutes = Int(time) / 60 % 60
        seconds = Int(time) % 60
        return String(format:"%02i : %02i : %02i", hours, minutes, seconds)
    }
    
}

