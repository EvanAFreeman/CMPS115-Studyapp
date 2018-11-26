//
//  timer.swift
//  StudyCat
//
//  Created by Camille Rogers on 11/15/18.
//  Copyright © 2018 Kit. All rights reserved.
//

import Foundation


class run_timer1{
    
    
    static let shared = run_timer1()
    var timer = Timer()
    init() {
        self.timer = Timer()
    }
    
    var seconds = 0
    var minutes = 0
    var hours = 0
    var string = ""
    var already_running = false
    var time_sec = 0
    
    func run_timer(){
        if(run_timer1.shared.already_running == false){
            run_timer1.shared.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(run_timer1.shared.counter), userInfo: nil, repeats: true)
            RunLoop.current.add(run_timer1.shared.timer, forMode: RunLoopMode.defaultRunLoopMode)
            run_timer1.shared.already_running = true
        }
    }
    
    @objc func counter(){
        if(run_timer1.shared.time_sec > 0){
            run_timer1.shared.time_sec -= 1
            //string = timeString(time: TimeInterval(TimerViewController.time_sec))
            //TimerViewController().counter_timer()
        }
        else{
            run_timer1.shared.timer.invalidate()
            //play alarm when study session is done
            // alarm_sound.play()
        }
    }
    
    
    
    //func run_timer(){
    func timeString(time:TimeInterval) -> String{
        
        hours = Int(time) / 3600
        minutes = Int(time) / 60 % 60
        seconds = Int(time) % 60
        return String(format:"%02i : %02i : %02i", hours, minutes, seconds)
    }
    
        //timer_running = true
}
    
    


