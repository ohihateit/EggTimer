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
    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    var player: AVAudioPlayer!
    var timer: Timer? = nil
    var totalTime = 0
    var secondsPassed = 1
    let eggTimes = ["Soft": 300, "Medium": 420, "Hard": 720]
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer?.invalidate()
        progressBar.progress = 0.0
        secondsPassed = 0
        
        if player != nil {
            if player.isPlaying {
                player.stop()
            }
        }
        
        totalTime  = eggTimes[sender.currentTitle!]!
        titleLable.text = sender.currentTitle
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        if secondsPassed < totalTime {
            secondsPassed += 1
            progressBar.progress = Float(secondsPassed) / Float(totalTime)
            print(Float(secondsPassed) / Float(totalTime))
        } else {
            titleLable.text = "DONE!"
            playSound()
            timer?.invalidate()
        }
    }
    
    func playSound() {
        let url = Bundle.main.url(forResource: "alarm", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
}
