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
        if(run_timer1.shared.ischecked==false){
            run_timer1.shared.check = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(viewDidLoad), userInfo: nil, repeats: true)
            run_timer1.shared.ischecked=true
        }
        
        if(run_timer1.shared.break_bool == true){
            run_timer1.shared.run_timer2()
            run_timer1.shared.timer.invalidate()
            break_timer.isHidden = false
            timer_label.isHidden = true
            counter_timer2()
        }
            
        else if(run_timer1.shared.timer_running == true){
            run_timer1.shared.timer2.invalidate()
            run_timer1.shared.run_timer()
            break_timer.isHidden = true
            timer_label.isHidden = false
            run_timer1.shared.run_timer()
            counter_timer()
        }
    }
    
    var seconds = 0
    // var check = Timer()
    var picked = false
    
    
    //labels for timers
    @IBOutlet weak var break_timer: UILabel!
    @IBOutlet weak var timer_label: UILabel!
    
    func counter_timer(){
        timer_label.text = run_timer1.shared.timeString(time: TimeInterval(run_timer1.shared.time_sec))
    }
    
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
            //set timer_label to thirty minutes
            timer_label.text = run_timer1.shared.timeString(time: TimeInterval(run_timer1.shared.time_sec))
            //make break timer hidden from view
            break_timer.isHidden = true
        }
    }
    
    @IBOutlet weak var hour_outlet: UIButton!
    @IBAction func hour_button(_ sender: UIButton) {
        timer_label.isHidden = false
        run_timer1.shared.timer_running = false
        if(picked == false){
            picked = true
            run_timer1.shared.time_sec = 3600
            timer_label.text = run_timer1.shared.timeString(time: TimeInterval(run_timer1.shared.time_sec))
            break_timer.isHidden = true
        }
    }
    
    
    @IBOutlet weak var hourThirty_outlet: UIButton!
    @IBAction func hourThirty_button(_ sender: UIButton) {
        timer_label.isHidden = false
        run_timer1.shared.timer_running = false
        if(picked == false){
            picked = true
            run_timer1.shared.time_sec = 5400
            timer_label.text = run_timer1.shared.timeString(time: TimeInterval(run_timer1.shared.time_sec))
            break_timer.isHidden = true
        }
    }
    
    @IBOutlet weak var twoHours_outlet: UIButton!
    @IBAction func twoHours_button(_ sender: UIButton) {
        timer_label.isHidden = false
        run_timer1.shared.timer_running = false
        if(picked == false){
            picked = true
            run_timer1.shared.time_sec = 7200
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

