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
   
   
    //set outlet for white cat in tree and define UIImage variable for the cat animation
    @IBOutlet weak var cat_tree_white: UIImageView!
    var cat_tree_1: UIImage!
    var cat_tree_2: UIImage!
    var cat_tree_3: UIImage!
    var cat_tree_4: UIImage!
    var cat_tree_5: UIImage!
    
    //set outlet for cat scratching tree and define UIImage variable for the cat animation
    @IBOutlet weak var cat_scratch: UIImageView!
    var cat_scratch1: UIImage!
    var cat_scratch2: UIImage!
    var cat_scratch3: UIImage!
    var cat_scratch4: UIImage!
    var cat_scratch5: UIImage!
    
    //set outlet for cat sitting on the floor and define UIImage variable for the cat animation
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
    
    //set outlet for laying in tree and define UIImage variable for the cat animation
    @IBOutlet weak var laying_cat: UIImageView!
    var laying1: UIImage!
    var laying2: UIImage!
    var laying3: UIImage!
    var laying4: UIImage!
    var laying5: UIImage!
    var laying6: UIImage!
    
    //set outlet for cat in bed and define UIImage variable for the cat animation
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
    
    //set outlet for cat shaking its tail and define UIImage variable for the cat animation
    @IBOutlet weak var shaking_butt: UIImageView!
    var shaking1: UIImage!
    var shaking2: UIImage!
    var shaking3: UIImage!
    var shaking4: UIImage!
    var shaking5: UIImage!
    var shaking6: UIImage!
    var shaking7: UIImage!
    var shaking8: UIImage!
    
    //set outlet for cat standing and define UIImage variable for the cat animation
    @IBOutlet weak var standing_cat: UIImageView!
    var standing1: UIImage!
    var standing2: UIImage!
    var standing3: UIImage!
    var standing4: UIImage!
    var standing5: UIImage!
    var standing6: UIImage!
    
    //set outlet for cat with mouse it in mouth and define UIImage variable for the cat animation
    @IBOutlet weak var mouse_cat: UIImageView!
    var mouse1: UIImage!
    var mouse2: UIImage!
    var mouse3: UIImage!
    var mouse4: UIImage!
    var mouse5: UIImage!
    var mouse6: UIImage!
   
    //set outlet for cat in box and define UIImage variable for the cat animation
    @IBOutlet weak var cat_in_box: UIImageView!
    var box: UIImage!
    var box1: UIImage!
    var box2: UIImage!
    var box3: UIImage!
    var box4: UIImage!
    var box5: UIImage!
    
    
    //set outlet for cat at the top of the tree and define UIImage variable for the cat animation
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
    
    //set outlet for tabby cat in the tree and define UIImage variable for the cat animation
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
    
    //set outlet for cat sitting on window and define UIImage variable for the cat animation
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
    
    @IBOutlet weak var myTableView: UITableView!
    @IBOutlet weak var input: UITextField!
    ///////////////////////////////////////
    // Code Start #1: Allow user to add to-do list and push it with the add button
    // reload the list every time a new item gets added to the list
    @IBAction func additem(_ sender: Any) {
        if(input.text != ""){
            todo_list.shared.list.append(input.text!) //add the new item to the array
            input.text = ""// so that the user can input some new text
        }
        myTableView.reloadData()
    }
    // Code End #1
    /////////////////////////////////////////////////
    // Code Start#2: Show/display the to-do list items on the screen
    // define how many rows we want in our table view
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (todo_list.shared.list.count)
    }
    //populate the table view with some text, go through all the items in the to-do list
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = todo_list.shared.list[indexPath.row]
        return (cell)
    }
    // will allow the user to delete items by swiping left
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath){
        if editingStyle == UITableViewCellEditingStyle.delete{
            todo_list.shared.list.remove(at: indexPath.row)
            myTableView.reloadData()
        }
    }
    ////////////////////////////////////////////////////

    //Create arrays to store the UIImages to create animations for each of the cat
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
    
  
    @IBOutlet weak var boxCatTrail: NSLayoutConstraint!
    
    @IBOutlet weak var boxCatLead: NSLayoutConstraint!
    
    @IBOutlet weak var boxCatView: UIImageView!

    override func viewDidLoad() {
       // TimerViewController().delegate = self
        super.viewDidLoad()
        
        //create a timer to check every second whether the study time has reached a certain timer to make a cat appear
        run_timer1.shared.check2 = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.cat_appear), userInfo: nil, repeats: true)
        
        
        //timer_main.text = time_string  
        
       // let music_file = Bundle.main.path(forResource: "alarm", ofType: ".mp3")
        
        //do{
        //    try alarm_sound = AVAudioPlayer(contentsOf: URL(fileURLWithPath: music_file!))
       // }
        
        //catch{
        //    print(error)
    //    }
    
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        //let boxCatVisible = false
        
//        
//            if !boxCatVisible{
//                //boxCatLead.constant = 150
//                //boxCatTrail.constant = -150
//                boxCatView.isHidden = true
//            }
//            else{
//                //boxCatLead.constant = 33
//                //boxCatTrail.constant = -18
//                boxCatView.isHidden = false
//            }
//
        
        
//        let metaData = StorageMetadata()
//        metaData.contentType = "image/jpeg"
        
//        let study_cats = [("bed", 11), ("cat_scratch", 5), ("white_cat", 5),
//                        ("book", 9), ("laying", 6), ("mouse", 6),
//                        ("shaking", 8), ("sitting", 15), ("standing", 6),
//                        ("tabby_cat", 14), ("window_cat", 10), ("box", 5),
//                        ("sprite", 15)]
//
//        for cat in study_cats {
//            uploadImages(filename: cat.0, num_images: cat.1, data: metaData)
//        }
        
        let mice_cat: Cat = Cat()
        images12 = loadCat(filename: "mouse", num_images: 6)
        mice_cat.addImages(imgArray: images12)

        let stand_cat: Cat = Cat()
        images11 = loadCat(filename: "standing", num_images: 6)
        stand_cat.addImages(imgArray: images11)

        let shaking_cat: Cat = Cat()
        images10 = loadCat(filename: "shaking", num_images: 8)
        shaking_cat.addImages(imgArray: images10)
        
        let bed_cat: Cat = Cat()
        images9 = loadCat(filename: "bed", num_images: 9)
        bed_cat.addImages(imgArray: images9)

        let lay_cat: Cat = Cat()
        images8 = loadCat(filename: "laying", num_images: 6)
        lay_cat.addImages(imgArray: images8)

        let sitting_cat: Cat = Cat()
        images7 = loadCat(filename: "sitting", num_images: 15)
        sitting_cat.addImages(imgArray: images7)
        
        let white_cat: Cat = Cat()
        images6 = loadCat(filename: "white_cat", num_images: 5)
        white_cat.addImages(imgArray: images6)
        
        let scratch_cat: Cat = Cat()
        images5 = loadCat(filename: "cat_scratch", num_images: 5)
        scratch_cat.addImages(imgArray: images5)
        
        let window_cat: Cat = Cat()
        images4 = loadCat(filename: "window_cat", num_images: 10)
        window_cat.addImages(imgArray: images4)
        
        let siamese_cat: Cat = Cat()
        images2 = loadCat(filename: "sprite", num_images: 15)
        siamese_cat.addImages(imgArray: images2)
        
        let tabby_cat: Cat = Cat()
        images3 = loadCat(filename: "tabby_cat", num_images: 14)
        tabby_cat.addImages(imgArray: images3)
        
        let box_cat: Cat = Cat()
        images = loadCat(filename: "box", num_images: 5)
        box_cat.addImages(imgArray: images)
        
        /*
            In total we have twelve cats up for modification:
                1. mice_cat
                2. stand_cat
                3. shaking_cat
                4. bed_cat
                5. lay_cat
                6. sitting_cat
                7. white_cat
                8. scratch_cat
                9. window_cat
                10. siamese_cat
                11. tabby_cat
                12. box_cat
         */
    
        let random_cat: Cat = Cat()
        random_cat.addImages(imgArray: randomCat(image_list: mice_cat.getImages()))
        
        //probably do the randomization here?
        
        let imageView = UIImageView(image: random_cat.getImages()[0])
        imageView.frame = CGRect(x: 300, y: 0, width: 100, height: 100)
        view.addSubview(imageView)
        
        let animated_random_cat = UIImage.animatedImage(with: random_cat.getImages(), duration: 2.0)
        imageView.image = animated_random_cat
        
        
        //animated each of the cats and specify the duration wanted for the animation (usually 2 seconds)
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

//        animatedImage = UIImage.animatedImage(with: images, duration: 2.0)
//        if cat_in_box != nil {
//            cat_in_box.image = animated_random_cat//animatedImage
//        }
    }
    
    func randomCat(image_list: [UIImage]) -> [UIImage] {
        var temp = [UIImage]()
        let rand = randomNumber()
        for img in image_list {
            temp.append(newColor(image: img, randColor: rand))
        }
        return temp
    }
    
    func randomNumber() -> Float {
        return Float(Int.random(in: 0 ... 10)) / 10.0
    }
    
    func newColor(image: UIImage, randColor: Float) -> UIImage {
        let newImage = CIImage(image: image)
        //let modImage = newImage?.applyingFilter("CIColorControls", withInputParameters:[kCIInputSaturationKey: randColor])
        let modImage = newImage?.applyingFilter("CIHueAdjust", withInputParameters: [kCIInputAngleKey: randColor])
        
        return UIImage(ciImage: modImage!)
    }
    func getInfo(input: UIImage) -> Array<UIColor> {
        let width = Int(input.size.width)
        let height = Int(input.size.height)
        
        guard let pixelData = input.cgImage?.dataProvider?.data else { return [] }
        let data: UnsafePointer<UInt8> = CFDataGetBytePtr(pixelData)
        
        var imageColors: [UIColor] = []
        
        for x in 0..<width{
            for y in 0..<height {
                let point = CGPoint(x: x, y: y)
                let pixelInfo: Int = ((width * Int(point.y)) + Int(point.x)) * 4
                let color = UIColor(red: CGFloat(data[pixelInfo]) / 255.0,
                                    green: CGFloat(data[pixelInfo + 1]) / 255.0,
                                    blue: CGFloat(data[pixelInfo + 2]) / 255.0,
                                    alpha: CGFloat(data[pixelInfo + 3]) / 255.0)
                imageColors.append(color)
            }
        }
        return imageColors
    }
    
    func uploadImages(filename: String, num_images: Int, data:
        StorageMetadata) {
        for i in 1...num_images {
            let file = filename + "_" + String(i)
            let file_UI = UIImage(named: file)
            
            let temp = storage.child(String("cat_pictures/" + file))
            temp.putData(UIImageJPEGRepresentation(file_UI!, 0.8)!, metadata: data) { (data, error) in
                if error == nil {
                    print("upload successful")
                } else {
                    print("error")
                }
            }
        }
    }
   

    func loadCat(filename: String, num_images: Int) -> [UIImage]{
        var images = [UIImage]()
        for i in 1...num_images {
            //e.g. cat_pictures/box_i
            let temp = storage.child(String(format: "cat_pictures/" + filename + "_" + String(i)))
            temp.getData(maxSize: 1*1000*1000) { (data, error) in
                if error == nil {
                    print(String(format: filename + "_%d retreived successfully\n", i))
                    //I HAD IT HERE BEFORE
                } else {
                    print(String(format: "there was an error loading the cat %d\n", i))
                }
            }
            images.append(UIImage(named: String(format: filename + "_%d", i))!) //NOW ITS HERE
        }
        return images
    }

    
    var boxCatUnlocked = false
    var standingCatUnlocked = false
    var bedCatUnlocked = false
    var shakingCatUnlocked = false
    var mouseCatUnlocked = false
    var layingCatUnlocked = false
    var sittingCatUnlocked = false
    var tabbyCatUnlocked = false
    var treeCatUnlocked = false
    var scratchCatUnlocked = false
    var windowCatUnlocked = false
    var tree2CatUnlocked = false
    
    //function that check2 will check every second to see if the study time is at a certain time to make cats appear
    func cat_appear(){
        if ((run_timer1.shared.already_running == false) && run_timer1.shared.break_bool == false){
            cat_in_box.isHidden = true
            standing_cat.isHidden = true
            cat_bed.isHidden = true
            shaking_butt.isHidden = true
            mouse_cat.isHidden = true
            laying_cat.isHidden = true
            cat_sitting.isHidden = true
            tabby_in_tree.isHidden = true
            cat_tree_white.isHidden = true
            cat_scratch.isHidden = true
            cat_window.isHidden = true
            cat_in_tree.isHidden = true
        }
        
        if (run_timer1.shared.already_running == true || run_timer1.shared.break_already_running == true) && (run_timer1.shared.time_sec <= (1795)){
            cat_in_box.isHidden = false
        }
        
        if (run_timer1.shared.already_running == true || run_timer1.shared.break_already_running == true) && (run_timer1.shared.time_sec <= ((run_timer1.shared.totalTime/12) * 10) + 10){
            standing_cat.isHidden = false
        }
        
        if (run_timer1.shared.already_running == true || run_timer1.shared.break_already_running == true) && (run_timer1.shared.time_sec <= ((run_timer1.shared.totalTime/12) * 9) + 10){
            cat_bed.isHidden = false
        }
        
        if (run_timer1.shared.already_running == true || run_timer1.shared.break_already_running == true) && (run_timer1.shared.time_sec <= ((run_timer1.shared.totalTime/12) * 8) + 10){
            shaking_butt.isHidden = false
        }
        
        if (run_timer1.shared.already_running == true || run_timer1.shared.break_already_running == true) && (run_timer1.shared.time_sec <= ((run_timer1.shared.totalTime/12) * 7) + 10){
            mouse_cat.isHidden = false
        }
        
        if (run_timer1.shared.already_running == true || run_timer1.shared.break_already_running == true) && (run_timer1.shared.time_sec <= ((run_timer1.shared.totalTime/12) * 6) + 10){
            laying_cat.isHidden = false
        }
        
        if (run_timer1.shared.already_running == true || run_timer1.shared.break_already_running == true) && (run_timer1.shared.time_sec <= ((run_timer1.shared.totalTime/12) * 5) + 10){
            cat_sitting.isHidden = false
        }
        
        if (run_timer1.shared.already_running == true || run_timer1.shared.break_already_running == true) && (run_timer1.shared.time_sec <= ((run_timer1.shared.totalTime/12) * 4) + 10){
            tabby_in_tree.isHidden = false
        }
        
        if (run_timer1.shared.already_running == true || run_timer1.shared.break_already_running == true) && (run_timer1.shared.time_sec <= ((run_timer1.shared.totalTime/12) * 3) + 10){
            cat_tree_white.isHidden = false
        }
        
        if (run_timer1.shared.already_running == true || run_timer1.shared.break_already_running == true) && (run_timer1.shared.time_sec <= ((run_timer1.shared.totalTime/12) * 2) + 10){
            cat_scratch.isHidden = false
        }
        
        if (run_timer1.shared.already_running == true || run_timer1.shared.break_already_running == true) && (run_timer1.shared.time_sec <= ((run_timer1.shared.totalTime/12) * 1) + 10){
            cat_window.isHidden = false
        }
        
        if (run_timer1.shared.already_running == true || run_timer1.shared.break_already_running == true) && (run_timer1.shared.time_sec <= 10){
            cat_in_tree.isHidden = false
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //if user exits main view invalidate (stop) check2 timer
    override func viewWillDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated);
        run_timer1.shared.check2.invalidate()
        
    }
    
    
    

}

