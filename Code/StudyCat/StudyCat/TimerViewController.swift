//
//  TimerViewController.swift
//  StudyCat
//
//  Created by Camille Rogers on 11/15/18.
//  Copyright © 2018 Kit. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController {

    //var alarm_sound: AVAudioPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        // let music_file = Bundle.main.path(forResource: "alarm", ofType: ".mp3")
        
        //do{
        //    try alarm_sound = AVAudioPlayer(contentsOf: URL(fileURLWithPath: music_file!))
        // }
        
        //catch{
        //    print(error)
        //    }
        
        
    }
    
   
    
    var seconds = 0
    var timer = Timer()
    var timer2 = Timer()
    var minutes = 0
    var hours = 0
    var timer_running = false
    var resume = false
    var time_sec = 0
    var break_time = 0
    var picked = false
    var break_bool = false
    
    //labels for timers
    @IBOutlet weak var break_timer: UILabel!
    @IBOutlet weak var timer_label: UILabel!
    
    
    //button action for thirty minutes
    @IBOutlet weak var thirty_outlet: UIButton!
    @IBAction func thirty_button(_ sender: UIButton) {
        timer_label.isHidden = false
        timer_running = false
        //set picked = true, so only one option can be picked
        if(picked == false){
            picked = true
            time_sec = 1800
            //set timer_label to thirty minutes
            timer_label.text = timeString(time: TimeInterval(time_sec))
            //make break timer hidden from view
            break_timer.isHidden = true
        }
    }
    
    @IBOutlet weak var hour_outlet: UIButton!
    @IBAction func hour_button(_ sender: UIButton) {
        timer_label.isHidden = false
        timer_running = false
        if(picked == false){
            picked = true
            time_sec = 3600
            timer_label.text = timeString(time: TimeInterval(time_sec))
            break_timer.isHidden = true
        }
    }
    
    
    @IBOutlet weak var hourThirty_outlet: UIButton!
    @IBAction func hourThirty_button(_ sender: UIButton) {
        timer_label.isHidden = false
        timer_running = false
        if(picked == false){
            picked = true
            time_sec = 5400
            timer_label.text = timeString(time: TimeInterval(time_sec))
            break_timer.isHidden = true
        }
    }
    
    
    @IBOutlet weak var twoHours_outlet: UIButton!
    @IBAction func twoHours_button(_ sender: UIButton) {
        timer_label.isHidden = false
        timer_running = false
        if(picked == false){
            picked = true
            time_sec = 7200
            timer_label.text = timeString(time: TimeInterval(time_sec))
            break_timer.isHidden = true
        }
    }
    
    
    //actions for start button
    @IBOutlet weak var start_outlet: UIButton!
    @IBAction func start_button(_ sender: UIButton) {
        timer_label.isHidden = false
        break_timer.isHidden = true
        //if timer isn't run then run_timer()
        if(timer_running == false){
            timer_running = true
            run_timer()
        }
    }
    
    
    
    //uses built in Timer() function, set bool timer_running = true
    func run_timer(){
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(TimerViewController.counter), userInfo: nil, repeats: true)
        RunLoop.current.add(timer, forMode: RunLoopMode.defaultRunLoopMode)
     }
    
   
    
    //used for break timer
    func run_timer2(){
        timer2 = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(TimerViewController.counter2), userInfo: nil, repeats: true)
        RunLoop.current.add(timer2, forMode: RunLoopMode.defaultRunLoopMode)
        
    }
    
    //used for break
    func counter2(){
        if(break_time > 0){
            break_time -= 1
            break_timer.text = timeString(time: TimeInterval(break_time))
        }
        else{
            //make timer_label unhidden and break_timer hidden
            timer_label.isHidden = false
            break_timer.isHidden = true
            timer2.invalidate()
            run_timer()
            self.resume = false
            //play alarm when break is done
            // alarm_sound.play()
        }
    }
    
    //for study tiemr
    func counter(){
        if(time_sec > 0){
            time_sec -= 1
            timer_label.text = timeString(time: TimeInterval(time_sec))
        }
        else{
            timer.invalidate()
            //play alarm when study session is done
            // alarm_sound.play()
        }
    }
    
    //stop button: cancel study session
    @IBOutlet weak var reset_outlet: UIButton!
    @IBAction func reset_button(_ sender: UIButton) {
        timer_running = false
        timer_label.isHidden = false
        break_timer.isHidden = true
        timer.invalidate()
        timer2.invalidate()
        time_sec = 0
        break_timer.text = timeString(time: TimeInterval(time_sec))
        timer_label.text = timeString(time: TimeInterval(time_sec))
        picked = false
        break_bool = false
        
    }
    
    //Click when user want to take a 2 minute break
    @IBOutlet weak var break_outlet: UIButton!
    @IBAction func break_button(_ sender: UIButton) {
        if (self.resume == false && break_bool == false){
            break_bool = true
            timer.invalidate()
            run_timer2()
            self.resume = true
            timer_label.isHidden = true
            break_timer.isHidden = false
            //set time to 2 minutes
            break_time = 120
            break_timer.text = timeString(time: TimeInterval(break_time))
            timer_running = false
        }
        
        if (self.resume == true && break_bool == false){
            timer_label.isHidden = false
            break_timer.isHidden = true
            
            timer2.invalidate()
            run_timer()
            self.resume = false
            //self.pause_outlet.setTitle("Pause",for: .normal)
        }
        
    }
    
    
    func timeString(time:TimeInterval) -> String{
        hours = Int(time) / 3600
        minutes = Int(time) / 60 % 60
        seconds = Int(time) % 60
        return String(format:"%02i : %02i : %02i", hours, minutes, seconds)
    }
    
    
    
    
 
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
