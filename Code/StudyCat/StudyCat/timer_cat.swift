//
//  timer_cat.swift
//  StudyCat
//
//  Created by Camille Rogers on 11/13/18.
//  Copyright © 2018 Kit. All rights reserved.
//

import Foundation

var seconds = 0
var timer = Timer()
var minutes = 0
var hours = 0
var timer_running = false
var resume = false
var time_sec = 0
var label1 = ""

public class timer_cat {
    

var variable = ""
//@IBOutlet weak var slider_outlet: UISlider!
func slider_timer(label: String) {
    //label1 = label
    //time_sec = Int(sender.value)
    time_sec = Int(label1)!
    label1 = timeString(time: TimeInterval(time_sec))
    //return label1
}

func start_button() {
    if(timer_running == false){
        run_timer()
    }
}



func run_timer(){
    timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timer_cat().counter), userInfo: nil, repeats: true)
    RunLoop.current.add(timer, forMode: RunLoopMode.defaultRunLoopMode)
    timer_running = true
}

    @objc func counter(){
    if(time_sec > 0){
        time_sec -= 1
        label1 = timeString(time: TimeInterval(time_sec))
    }
    else{
        timer.invalidate()
    }
}

    func pause_button(Bool: BooleanLiteralType) {
    if Bool == true{
        timer.invalidate()
    }
    else{
        run_timer()
    }
}

func reset_button() {
    timer_running = false
    timer.invalidate()
    time_sec = 0
    label1 = timeString(time: TimeInterval(time_sec))
}

func timeString(time:TimeInterval) -> String{
    hours = Int(time) / 3600
    minutes = Int(time) / 60 % 60
    seconds = Int(time) % 60
    return String(format:"%02i : %02i : %02i", hours, minutes, seconds)
}
}
