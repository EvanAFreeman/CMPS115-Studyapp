//
//  timer.swift
//  StudyCat
//
//  Created by Camille Rogers on 11/15/18.
//  Copyright © 2018 Kit. All rights reserved.
//

import Foundation
import AVFoundation
import AudioToolbox

//creates a global timer so the timer runs throughout all views
class run_timer1{
    
    //create a singleton class so there is only one instance of the Timer running
    static let shared = run_timer1()
    
    //initialize study timer, break timer, and checking timers
    var timer = Timer()
    var timer2 = Timer()
    var check = Timer()
    var check2 = Timer()
    
    //creates one instance of the Timers
    init() {
        self.timer = Timer()
        self.timer2 = Timer()
        self.check = Timer()
        self.check2 = Timer()
    }
    
    var ischecked = false
    var done = false
    var seconds = 0
    var minutes = 0
    var hours = 0
    var string = ""
    var already_running = false
    var break_already_running = false
    var time_sec = 0
    var break_time = 2;
    var timer_running = false
    var break_bool = false
    var resume = false
    var totalTime = 0
    
    
    //if function is called and timer isn't already running, create new timer that calls the function counter() to decrement the timer. Set the boolean already_running = true
    func run_timer(){
        if(run_timer1.shared.already_running == false){
            run_timer1.shared.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(run_timer1.shared.counter), userInfo: nil, repeats: true)
            RunLoop.current.add(run_timer1.shared.timer, forMode: RunLoopMode.defaultRunLoopMode)
            run_timer1.shared.already_running = true
        }
    }
    
    //if function is called and break isn't already running, create new timer that calls the function counter2() to decrement the timer. Set the boolean break_already_running = true
    func run_timer2(){
        if(run_timer1.shared.break_already_running == false){
            timer2 = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(run_timer1.shared.counter2), userInfo: nil, repeats: true)
            RunLoop.current.add(run_timer1.shared.timer2, forMode: RunLoopMode.defaultRunLoopMode)
            run_timer1.shared.break_already_running = true
        }
    }
    
    //This function updates the break time
    @objc func counter2(){
        //if the break_time is not 0 then decrement by one
        if(run_timer1.shared.break_time > 0){
            run_timer1.shared.break_time -= 1
            run_timer1.shared.break_bool = true
        }
            //else if the break time is over invalidate the break timer, start running the study timer, and play an alarm sound
        else{
            run_timer1.shared.timer2.invalidate()
            run_timer1.shared.run_timer()
            run_timer1.shared.resume = false
            run_timer1.shared.break_bool = false
            run_timer1.shared.timer_running = true
            run_timer1.shared.done = true
            AudioServicesPlaySystemSound(SystemSoundID(1304))
            AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
            //play alarm when break is done
        }
    }
    
    //This function updates the study timer time
    @objc func counter(){
        //if the study time is not 0 then decrement the time by one
        if(run_timer1.shared.time_sec > 0){
            run_timer1.shared.time_sec -= 1
        }
            //else if the study time is over invalidate the timer, set booleans of running to false and play alarm sound
        else{
            run_timer1.shared.timer.invalidate()
            run_timer1.shared.timer_running = false
            run_timer1.shared.already_running = false
            AudioServicesPlaySystemSound(SystemSoundID(1304))
            AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
            //play alarm when study session is done
        }
    }
    
    //func run_timer(){
    func timeString(time:TimeInterval) -> String{
        //converts seconds to hours, minutes, and seconds
        hours = Int(time) / 3600
        minutes = Int(time) / 60 % 60
        seconds = Int(time) % 60
        //returns a String in the form 00 : 00 : 00
        return String(format:"%02i : %02i : %02i", hours, minutes, seconds)
    }
    
}





