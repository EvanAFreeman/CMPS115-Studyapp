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

class run_timer1{
    
    static let shared = run_timer1()
    var timer = Timer()
    var timer2 = Timer()
    var check = Timer()
    var check2 = Timer()
    
    
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
    
    
    func run_timer(){
        if(run_timer1.shared.already_running == false){
            run_timer1.shared.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(run_timer1.shared.counter), userInfo: nil, repeats: true)
            RunLoop.current.add(run_timer1.shared.timer, forMode: RunLoopMode.defaultRunLoopMode)
            run_timer1.shared.already_running = true
        }
    }
    
    func run_timer2(){
        if(run_timer1.shared.break_already_running == false){
            timer2 = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(run_timer1.shared.counter2), userInfo: nil, repeats: true)
            RunLoop.current.add(run_timer1.shared.timer2, forMode: RunLoopMode.defaultRunLoopMode)
            run_timer1.shared.break_already_running = true
        }
    }
    
    @objc func counter2(){
        if(run_timer1.shared.break_time > 0){
            run_timer1.shared.break_time -= 1
            run_timer1.shared.break_bool = true
        }
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
    
    @objc func counter(){
        if(run_timer1.shared.time_sec > 0){
            run_timer1.shared.time_sec -= 1
        }
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
        hours = Int(time) / 3600
        minutes = Int(time) / 60 % 60
        seconds = Int(time) % 60
        return String(format:"%02i : %02i : %02i", hours, minutes, seconds)
    }
    
}





