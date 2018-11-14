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

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    var list = ["Read"]
    
    @IBOutlet weak var myTableView: UITableView!
    @IBOutlet weak var input: UITextField!
    ///////////////////////////////////////
    // Code Start #1: Get user to do list item and allow user to send with button
    @IBAction func additem(_ sender: Any) {
        if(input.text != ""){
            list.append(input.text!) //add the new item to the array
            input.text = ""// so that the user can input some new text
        }
        myTableView.reloadData()
    }
    // Code End #1
    /////////////////////////////////////////////////
    // Code Start#2: List all the items and display it on the screen
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (list.count)
    }
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = list[indexPath.row]
        return (cell)
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath){
        if editingStyle == UITableViewCellEditingStyle.delete{
            self.list.remove(at: indexPath.row)
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
}

