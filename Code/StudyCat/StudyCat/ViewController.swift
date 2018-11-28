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
import AVFoundation

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
   
   
    
    @IBOutlet weak var cat_tree_white: UIImageView!
    var cat_tree_1: UIImage!
    var cat_tree_2: UIImage!
    var cat_tree_3: UIImage!
    var cat_tree_4: UIImage!
    var cat_tree_5: UIImage!
    
    

    @IBOutlet weak var cat_scratch: UIImageView!
    var cat_scratch1: UIImage!
    var cat_scratch2: UIImage!
    var cat_scratch3: UIImage!
    var cat_scratch4: UIImage!
    var cat_scratch5: UIImage!
    //var list = ["Read"]
    
    @IBOutlet weak var cat_sitting: UIImageView!
    var cat_sit1: UIImage!
    var cat_sit2: UIImage!
    var cat_sit3: UIImage!
    var cat_sit4: UIImage!
    var cat_sit5: UIImage!
    var cat_sit6: UIImage!
    var cat_sit7: UIImage!
    var cat_sit8: UIImage!
    var cat_sit9: UIImage!
    var cat_sit10: UIImage!
    var cat_sit11: UIImage!
    var cat_sit12: UIImage!
    var cat_sit13: UIImage!
    var cat_sit14: UIImage!
    var cat_sit15: UIImage!
    
    @IBOutlet weak var laying_cat: UIImageView!
    var laying1: UIImage!
    var laying2: UIImage!
    var laying3: UIImage!
    var laying4: UIImage!
    var laying5: UIImage!
    var laying6: UIImage!
    
    
    @IBOutlet weak var cat_bed: UIImageView!
    var bed1: UIImage!
    var bed2: UIImage!
    var bed3: UIImage!
    var bed4: UIImage!
    var bed5: UIImage!
    var bed6: UIImage!
    var bed7: UIImage!
    var bed8: UIImage!
    var bed9: UIImage!
    var bed10: UIImage!
    var bed11: UIImage!
    
    @IBOutlet weak var shaking_butt: UIImageView!
    var shaking1: UIImage!
    var shaking2: UIImage!
    var shaking3: UIImage!
    var shaking4: UIImage!
    var shaking5: UIImage!
    var shaking6: UIImage!
    var shaking7: UIImage!
    var shaking8: UIImage!
    
    @IBOutlet weak var standing_cat: UIImageView!
    var standing1: UIImage!
    var standing2: UIImage!
    var standing3: UIImage!
    var standing4: UIImage!
    var standing5: UIImage!
    var standing6: UIImage!
    
    @IBOutlet weak var mouse_cat: UIImageView!
    var mouse1: UIImage!
    var mouse2: UIImage!
    var mouse3: UIImage!
    var mouse4: UIImage!
    var mouse5: UIImage!
    var mouse6: UIImage!
    
    
   
    
    @IBOutlet weak var myTableView: UITableView!
    @IBOutlet weak var input: UITextField!
    ///////////////////////////////////////
    // Code Start #1: Get user to do list item and allow user to send with button
    @IBAction func additem(_ sender: Any) {
        if(input.text != ""){
            todo_list.shared.list.append(input.text!) //add the new item to the array
            input.text = ""// so that the user can input some new text
        }
        myTableView.reloadData()
    }
    // Code End #1
    /////////////////////////////////////////////////
    // Code Start#2: List all the items and display it on the screen
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (todo_list.shared.list.count)
    }
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = todo_list.shared.list[indexPath.row]
        return (cell)
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath){
        if editingStyle == UITableViewCellEditingStyle.delete{
            todo_list.shared.list.remove(at: indexPath.row)
            myTableView.reloadData()
        }
    }
    ////////////////////////////////////////////////////

    @IBOutlet weak var cat_in_box: UIImageView!
    var box: UIImage!
    var box1: UIImage!
    var box2: UIImage!
    var box3: UIImage!
    var box4: UIImage!
    var box5: UIImage!
    

    
    @IBOutlet weak var cat_in_tree: UIImageView!
    var cat1: UIImage!
    var cat2: UIImage!
    var cat3: UIImage!
    var cat4: UIImage!
    var cat5: UIImage!
    var cat6: UIImage!
    var cat7: UIImage!
    var cat8: UIImage!
    var cat9: UIImage!
    var cat10: UIImage!
    var cat11: UIImage!
    var cat12: UIImage!
    var cat13: UIImage!
    var cat14: UIImage!
    var cat15: UIImage!
    
    
    @IBOutlet weak var tabby_in_tree: UIImageView!
    var tabby1: UIImage!
    var tabby2: UIImage!
    var tabby3: UIImage!
    var tabby4: UIImage!
    var tabby5: UIImage!
    var tabby6: UIImage!
    var tabby7: UIImage!
    var tabby8: UIImage!
    var tabby9: UIImage!
    var tabby10: UIImage!
    var tabby11: UIImage!
    var tabby12: UIImage!
    var tabby13: UIImage!
    var tabby14: UIImage!
    var tabby15: UIImage!

    @IBOutlet weak var cat_window: UIImageView!
    var windowcat1: UIImage!
    var windowcat2: UIImage!
    var windowcat3: UIImage!
    var windowcat4: UIImage!
    var windowcat5: UIImage!
    var windowcat6: UIImage!
    var windowcat7: UIImage!
    var windowcat8: UIImage!
    var windowcat9: UIImage!
    var windowcat10: UIImage!
    
    var images13: [UIImage]!
    var animatedImage13: UIImage!
    
    var images12: [UIImage]!
    var animatedImage12: UIImage!
    
    var images11: [UIImage]!
    var animatedImage11: UIImage!
    
    var images10: [UIImage]!
    var animatedImage10: UIImage!
    
    var images9: [UIImage]!
    var animatedImage9: UIImage!
    
    var images8: [UIImage]!
    var animatedImage8: UIImage!
    
    var images7: [UIImage]!
    var animatedImage7: UIImage!
    
    var images6: [UIImage]!
    var animatedImage6: UIImage!
    
    var images5: [UIImage]!
    var animatedImage5: UIImage!
    
    var images4: [UIImage]!
    var animatedImage4: UIImage!
    
    var images3: [UIImage]!
    var animatedImage3: UIImage!
    
    var images2: [UIImage]!
    var animatedImage2: UIImage!
    

    var images: [UIImage]!
    let storage = Storage.storage().reference()
    let database = Database.database().reference()
    
    var animatedImage: UIImage!

    //var alarm_sound: AVAudioPlayer = AVAudioPlayer()
    
  
   

    override func viewDidLoad() {
       // TimerViewController().delegate = self
        super.viewDidLoad()
        
        //timer_main.text = time_string  
        
       // let music_file = Bundle.main.path(forResource: "alarm", ofType: ".mp3")
        
        //do{
        //    try alarm_sound = AVAudioPlayer(contentsOf: URL(fileURLWithPath: music_file!))
       // }
        
        //catch{
        //    print(error)
    //    }
    
        // Do any additional setup after loading the view, typically from a nib.
        
        //let bundleIdentifier =  Bundle.main.bundleIdentifier
        //print(bundleIdentifier!)
        let metaData = StorageMetadata()
        metaData.contentType = "image/jpeg"
        
        images = loadCatBox()
        
        cat1 = UIImage(named: "sprite_00")
        cat2 = UIImage(named: "sprite_01")
        cat3 = UIImage(named: "sprite_02")
        cat4 = UIImage(named: "sprite_03")
        cat5 = UIImage(named: "sprite_04")
        cat6 = UIImage(named: "sprite_05")
        cat7 = UIImage(named: "sprite_06")
        cat8 = UIImage(named: "sprite_07")
        cat9 = UIImage(named: "sprite_08")
        cat10 = UIImage(named: "sprite_09")
        cat11 = UIImage(named: "sprite_10")
        cat12 = UIImage(named: "sprite_11")
        cat13 = UIImage(named: "sprite_12")
        cat14 = UIImage(named: "sprite_13")
        cat15 = UIImage(named: "sprite_14")
        
        tabby1 = UIImage(named: "tabby_cat00")
        tabby2 = UIImage(named: "tabby_cat01")
        tabby3 = UIImage(named: "tabby_cat02")
        tabby4 = UIImage(named: "tabby_cat03")
        tabby5 = UIImage(named: "tabby_cat04")
        //tabby6 = UIImage(named: "tabby_cat05")
        tabby7 = UIImage(named: "tabby_cat06")
        tabby8 = UIImage(named: "tabby_cat07")
        tabby9 = UIImage(named: "tabby_cat08")
        tabby10 = UIImage(named: "tabby_cat09")
        tabby11 = UIImage(named: "tabby_cat10")
        tabby12 = UIImage(named: "tabby_cat11")
        tabby13 = UIImage(named: "tabby_cat12")
        tabby14 = UIImage(named: "tabby_cat13")
        tabby15 = UIImage(named: "tabby_cat14")
        
        
        windowcat1 = UIImage(named: "window_cat00")
        windowcat2 = UIImage(named: "window_cat01")
        windowcat3 = UIImage(named: "window_cat02")
        windowcat4 = UIImage(named: "window_cat03")
        windowcat5 = UIImage(named: "window_cat04")
        windowcat6 = UIImage(named: "window_cat05")
        windowcat7 = UIImage(named: "window_cat06")
        windowcat8 = UIImage(named: "window_cat07")
        windowcat9 = UIImage(named: "window_cat08")
        windowcat10 = UIImage(named: "window_cat09")
        
        cat_scratch1 = UIImage(named: "cat_scratch0")
        cat_scratch2 = UIImage(named: "cat_scratch1")
        cat_scratch3 = UIImage(named: "cat_scratch2")
        cat_scratch4 = UIImage(named: "cat_scratch3")
        cat_scratch5 = UIImage(named: "cat_scratch4")
        
        cat_tree_1 = UIImage(named: "white_cat0")
        cat_tree_2 = UIImage(named: "white_cat1")
        cat_tree_3 = UIImage(named: "white_cat2")
        cat_tree_4 = UIImage(named: "white_cat3")
        cat_tree_5 = UIImage(named: "white_cat4")
        
        cat_sit1 = UIImage(named: "sitting_00")
        cat_sit2 = UIImage(named: "sitting_01")
        cat_sit3 = UIImage(named: "sitting_02")
        cat_sit4 = UIImage(named: "sitting_03")
        cat_sit5 = UIImage(named: "sitting_04")
        cat_sit6 = UIImage(named: "sitting_05")
        cat_sit7 = UIImage(named: "sitting_06")
        cat_sit8 = UIImage(named: "sitting_07")
        cat_sit9 = UIImage(named: "sitting_08")
        cat_sit10 = UIImage(named: "sitting_09")
        cat_sit11 = UIImage(named: "sitting_10")
        cat_sit12 = UIImage(named: "sitting_11")
        cat_sit13 = UIImage(named: "sitting_12")
        cat_sit14 = UIImage(named: "sitting_13")
        cat_sit15 = UIImage(named: "sitting_14")
        
        laying1 = UIImage(named: "laying_0")
        laying2 = UIImage(named: "laying_1")
        laying3 = UIImage(named: "laying_2")
        laying4 = UIImage(named: "laying_3")
        laying5 = UIImage(named: "laying_4")
        laying6 = UIImage(named: "laying_5")
        
        bed1 = UIImage(named: "bed_00")
        bed2 = UIImage(named: "bed_01")
        bed3 = UIImage(named: "bed_02")
        bed4 = UIImage(named: "bed_03")
        bed5 = UIImage(named: "bed_04")
        bed6 = UIImage(named: "bed_05")
        bed7 = UIImage(named: "bed_06")
        bed8 = UIImage(named: "bed_07")
        bed9 = UIImage(named: "bed_08")
        bed10 = UIImage(named: "bed_09")
        bed11 = UIImage(named: "bed_10")
        
        shaking1 = UIImage(named: "skaing_0")
        shaking2 = UIImage(named: "skaing_1")
        shaking3 = UIImage(named: "skaing_2")
        shaking4 = UIImage(named: "skaing_3")
        shaking5 = UIImage(named: "skaing_4")
        shaking6 = UIImage(named: "skaing_5")
        shaking7 = UIImage(named: "skaing_6")
        shaking8 = UIImage(named: "skaing_7")
        
        standing1 = UIImage(named: "standing_0")
        standing2 = UIImage(named: "standing_1")
        standing3 = UIImage(named: "standing_2")
        standing4 = UIImage(named: "standing_3")
        standing5 = UIImage(named: "standing_4")
        standing6 = UIImage(named: "standing_5")
        
        mouse1 = UIImage(named: "mouse_0")
        mouse2 = UIImage(named: "mouse_1")
        mouse3 = UIImage(named: "mouse_2")
        mouse4 = UIImage(named: "mouse_3")
        mouse5 = UIImage(named: "mouse_4")
        mouse6 = UIImage(named: "mouse_5")
        
            
        images12 = [mouse1, mouse2, mouse3, mouse4, mouse5, mouse6]
        
        images11 = [standing1, standing2, standing3, standing4, standing5, standing6]
        
        images10 = [shaking1, shaking2, shaking3, shaking4, shaking5, shaking6, shaking7, shaking8]
        
        images9 = [bed1, bed2, bed3, bed4, bed5, bed6, bed7, bed8, bed9, bed10, bed11]
        
        images8 = [laying1, laying2, laying3, laying4, laying5, laying6]
        
        images7 = [cat_sit1, cat_sit2,cat_sit3, cat_sit4, cat_sit5, cat_sit6, cat_sit7, cat_sit8, cat_sit9, cat_sit10, cat_sit11, cat_sit12, cat_sit13, cat_sit14, cat_sit15]
        
        images6 = [cat_tree_1, cat_tree_2, cat_tree_3, cat_tree_4, cat_tree_5]
        
        images5 = [cat_scratch1, cat_scratch2, cat_scratch3, cat_scratch4, cat_scratch5]
        
        
        images4 = [windowcat1, windowcat2, windowcat3, windowcat4, windowcat5, windowcat6, windowcat7, windowcat8, windowcat9, windowcat10]
        
        images2 = [cat1, cat2, cat3, cat4, cat5, cat6, cat7, cat8, cat9, cat10, cat11, cat12, cat13, cat14, cat15]
        
        images3 = [tabby1, tabby2, tabby3, tabby4, tabby5, tabby7, tabby8, tabby9, tabby10, tabby11, tabby12, tabby13, tabby14, tabby15]
        
        /*
        box1 = UIImage(named: "box_1")
        box2 = UIImage(named: "box_2")
        box3 = UIImage(named: "box_3")
        box4 = UIImage(named: "box_4")
        box5 = UIImage(named: "box_5")
        */
        
        //images = [box1, box2, box3, box4, box5]
 
    
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
        
        
        animatedImage12 = UIImage.animatedImage(with: images12, duration: 2.0)
        if mouse_cat != nil {
            mouse_cat.image = animatedImage12
        }
        
        animatedImage11 = UIImage.animatedImage(with: images11, duration: 2.0)
        if standing_cat != nil {
            standing_cat.image = animatedImage11
        }
        
        animatedImage10 = UIImage.animatedImage(with: images10, duration: 2.0)
        if shaking_butt != nil {
            shaking_butt.image = animatedImage10
        }
        
        animatedImage9 = UIImage.animatedImage(with: images9, duration: 2.0)
        if cat_bed != nil {
            cat_bed.image = animatedImage9
        }
        
        animatedImage8 = UIImage.animatedImage(with: images8, duration: 2.0)
        if laying_cat != nil {
            laying_cat.image = animatedImage8
        }

        animatedImage7 = UIImage.animatedImage(with: images7, duration: 2.0)
        if cat_sitting != nil {
            cat_sitting.image = animatedImage7
        }
        
        animatedImage6 = UIImage.animatedImage(with: images6, duration: 2.0)
        if cat_tree_white != nil {
            cat_tree_white.image = animatedImage6
        }
        
        animatedImage5 = UIImage.animatedImage(with: images5, duration: 2.0)
        if cat_scratch != nil {
            cat_scratch.image = animatedImage5
        }
        
        
        animatedImage4 = UIImage.animatedImage(with: images4, duration: 2.0)
        if cat_window != nil {
            cat_window.image = animatedImage4
        }
        
        animatedImage3 = UIImage.animatedImage(with: images3, duration: 2.0)
        if tabby_in_tree != nil {
            tabby_in_tree.image = animatedImage3
        }
        
        animatedImage2 = UIImage.animatedImage(with: images2, duration: 3.0)
        if cat_in_tree != nil {
            cat_in_tree.image = animatedImage2
        }
        
   
        animatedImage = UIImage.animatedImage(with: images, duration: 2.0)

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
    
    
    

}

