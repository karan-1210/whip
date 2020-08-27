//
//  ViewController.swift
//  whip
//
//  Created by Karan Khandelwal on 8/27/20.
//  Copyright © 2020 Karan Khandelwal. All rights reserved.
//

import UIKit
import AVFoundation
var player: AVAudioPlayer?

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
    }

    @IBAction func whipSound(_ sender: Any) {
         playSound()
    }
    func playSound() {
    guard let url = Bundle.main.url(forResource: "misc070", withExtension: "mp3") else { return }

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)

            /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)

            /* iOS 10 and earlier require the following line:
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */

            guard let player = player else { return }

            player.play()

        } catch let error {
            print(error.localizedDescription)
        }

    }
    
}

