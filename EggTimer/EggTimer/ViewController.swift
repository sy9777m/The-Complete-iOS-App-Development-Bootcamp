//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var eggProgressBar: UIProgressView!
    
    var player: AVAudioPlayer!
    let eggTime = ["Soft": 3, "Medium": 4, "Hard": 7]
    
    var totalTime:Float = 0
    var secondPassed:Float = 0
    var timer = Timer()
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        eggProgressBar.progress = 0.0
        timer.invalidate()
        
        
        let hardness = sender.currentTitle!
        titleLabel.text = hardness
        
        totalTime = Float(eggTime[hardness]!)
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }

    @objc func updateTimer() {
        if secondPassed < totalTime {
            let percentageProgress = secondPassed / totalTime
            eggProgressBar.progress = percentageProgress
            secondPassed += 1
        } else {
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
            eggProgressBar.progress = 1.0
            timer.invalidate()
            titleLabel.text = "Done!"
        }
    }

}
