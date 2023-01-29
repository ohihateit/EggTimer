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
    var player: AVAudioPlayer!
    var timer: Timer? = nil
    var secondsRemaining = 60
    let eggTimes = ["Soft": 3, "Medium": 4, "Hard": 7]
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer?.invalidate()
                
        secondsRemaining = eggTimes[sender.currentTitle!]!
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        if secondsRemaining > 0 {
            print("\(secondsRemaining) seconds.")
            secondsRemaining -= 1
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
