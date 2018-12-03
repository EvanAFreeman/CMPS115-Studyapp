//
//  TimerViewController.swift
//  StudyCat
//
//  Created by Camille Rogers on 11/15/18.
//  Copyright © 2018 Kit. All rights reserved.
//

import UIKit
import AVFoundation

class TimerViewController: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //if the user timer has not been checked (aka the timer that checks to update time) then initialize check timer
        if(run_timer1.shared.ischecked==false){
            run_timer1.shared.check = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(viewDidLoad), userInfo: nil, repeats: true)
            run_timer1.shared.ischecked=true
        }
        
        //if user is on break then start break timer and invalidate study session timer, make break label show and go to counter_timer2() to update the break label
        if(run_timer1.shared.break_bool == true){
            run_timer1.shared.run_timer2()
            run_timer1.shared.timer.invalidate()
            break_timer.isHidden = false
            timer_label.isHidden = true
            counter_timer2()
        }
            
            //if user is on study session then start study timer and invalidate break timer, make timer label show and go to counter_timer() to update the study timer label
        else if(run_timer1.shared.timer_running == true){
            run_timer1.shared.timer2.invalidate()
            run_timer1.shared.run_timer()
            break_timer.isHidden = true
            timer_label.isHidden = false
            run_timer1.shared.run_timer()
            counter_timer()
        }
    }
    
    
    //Used for the third views menu, deals with the constraint of the menus location and hides it offscreen when the menu button is pressed
    @IBOutlet weak var leadingConstraint3: NSLayoutConstraint!
    
    var menuShow = true
    @IBAction func menuView3(_ sender: Any) {
        if (menuShow){
            leadingConstraint3.constant = -67
            UIView.animate(withDuration: 0.3, animations: {
                self.view.layoutIfNeeded()
            })
        } else{
            leadingConstraint3.constant = 17
            
            UIView.animate(withDuration: 0.3, animations: {
                self.view.layoutIfNeeded()
            })
            view.layoutIfNeeded()
        }
        menuShow = !menuShow
    }
    
    
    
    var seconds = 0
    var picked = false
    
    
    //labels for timers
    @IBOutlet weak var break_timer: UILabel!
    @IBOutlet weak var timer_label: UILabel!
    
    //updates study timer
    func counter_timer(){
        timer_label.text = run_timer1.shared.timeString(time: TimeInterval(run_timer1.shared.time_sec))
    }
    
    //updates break timer
    func counter_timer2(){
        break_timer.text = run_timer1.shared.timeString(time: TimeInterval(run_timer1.shared.break_time))
    }
    
    //button action for thirty minutes
    @IBOutlet weak var thirty_outlet: UIButton!
    @IBAction func thirty_button(_ sender: UIButton) {
        timer_label.isHidden = false
        run_timer1.shared.timer_running = false
        //set picked = true, so only one option can be picked
        if(picked == false){
            picked = true
            run_timer1.shared.time_sec = 1800
            //totalTime is a helper for making the cats appear in ViewController.swift
            run_timer1.shared.totalTime = 1800
            //set timer_label to thirty minutes
            timer_label.text = run_timer1.shared.timeString(time: TimeInterval(run_timer1.shared.time_sec))
            //make break timer hidden from view
            break_timer.isHidden = true
        }
    }
    
    //button action for hour
    @IBOutlet weak var hour_outlet: UIButton!
    @IBAction func hour_button(_ sender: UIButton) {
        timer_label.isHidden = false
        run_timer1.shared.timer_running = false
        if(picked == false){
            picked = true
            run_timer1.shared.time_sec = 3600
            run_timer1.shared.totalTime = 3600
            timer_label.text = run_timer1.shared.timeString(time: TimeInterval(run_timer1.shared.time_sec))
            break_timer.isHidden = true
        }
    }
    
    //button action for hour thirty minutes
    @IBOutlet weak var hourThirty_outlet: UIButton!
    @IBAction func hourThirty_button(_ sender: UIButton) {
        timer_label.isHidden = false
        run_timer1.shared.timer_running = false
        if(picked == false){
            picked = true
            run_timer1.shared.time_sec = 5400
            run_timer1.shared.totalTime = 5400
            timer_label.text = run_timer1.shared.timeString(time: TimeInterval(run_timer1.shared.time_sec))
            break_timer.isHidden = true
        }
    }
    
    //button action for two hours
    @IBOutlet weak var twoHours_outlet: UIButton!
    @IBAction func twoHours_button(_ sender: UIButton) {
        timer_label.isHidden = false
        run_timer1.shared.timer_running = false
        if(picked == false){
            picked = true
            run_timer1.shared.time_sec = 7200
            run_timer1.shared.totalTime = 7200
            timer_label.text = run_timer1.shared.timeString(time: TimeInterval(run_timer1.shared.time_sec))
            break_timer.isHidden = true
        }
    }
    
    //actions for start button
    @IBOutlet weak var start_outlet: UIButton!
    @IBAction func start_button(_ sender: UIButton) {
        timer_label.isHidden = false
        break_timer.isHidden = true
        //if timer isn't run then run_timer()
        if(run_timer1.shared.timer_running == false){
            run_timer1.shared.timer_running = true
            run_timer1.shared.run_timer()
            timer_label.text = run_timer1.shared.timeString(time: TimeInterval(run_timer1.shared.time_sec))
            if(run_timer1.shared.ischecked == false){
                run_timer1.shared.ischecked = true
                run_timer1.shared.check = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(viewDidLoad), userInfo: nil, repeats: true)
            }
        }
    }
    
    //stop button: cancel study session
    @IBOutlet weak var reset_outlet: UIButton!
    @IBAction func reset_button(_ sender: UIButton) {
        run_timer1.shared.timer_running = false
        run_timer1.shared.already_running = false
        run_timer1.shared.break_already_running = false
        timer_label.isHidden = false
        break_timer.isHidden = true
        run_timer1.shared.timer.invalidate()
        run_timer1.shared.timer2.invalidate()
        run_timer1.shared.time_sec = 0
        run_timer1.shared.break_time = 0
        break_timer.text = run_timer1.shared.timeString(time: TimeInterval(run_timer1.shared.break_time))
        timer_label.text = run_timer1.shared.timeString(time: TimeInterval(run_timer1.shared.time_sec))
        picked = false
        run_timer1.shared.break_bool = false
        run_timer1.shared.done = false
        run_timer1.shared.check.invalidate()
        run_timer1.shared.ischecked = false
    }
    
    //Click when user want to take a 2 minute break
    @IBOutlet weak var break_outlet: UIButton!
    @IBAction func break_button(_ sender: UIButton) {
        if (run_timer1.shared.break_bool == false && run_timer1.shared.done == false){
            run_timer1.shared.break_bool = true
            run_timer1.shared.timer.invalidate()
            run_timer1.shared.resume = true
            timer_label.isHidden = true
            break_timer.isHidden = false
            //set time to 2 minutes
            run_timer1.shared.break_time = 120
            break_timer.text = run_timer1.shared.timeString(time: TimeInterval(run_timer1.shared.break_time))
            if(run_timer1.shared.ischecked == false){
                run_timer1.shared.ischecked = true
                run_timer1.shared.check = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(viewDidLoad), userInfo: nil, repeats: true)
            }
            run_timer1.shared.run_timer2()
            run_timer1.shared.timer_running = false
            run_timer1.shared.already_running = false
        }
    }
    
    //if the timer view dissapears then invalidate(stop) timer that updates the break and study timers
    override func viewWillDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        run_timer1.shared.ischecked = false
        run_timer1.shared.check.invalidate()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

