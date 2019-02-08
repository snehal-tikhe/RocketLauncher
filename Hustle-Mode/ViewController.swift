//
//  ViewController.swift
//  Hustle-Mode
//
//  Created by Snehal Tikhe on 12/20/18.
//  Copyright © 2018 Snehal Tikhe. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var cloudsImg: UIImageView!
    @IBOutlet weak var rocketImg: UIImageView!
    @IBOutlet weak var hustleModeOnLbl: UILabel!
    
    var player: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hustleModeOnLbl.isHidden = true
        
        let path = Bundle.main.path(forResource: "rocketlauncher", ofType: "wav")!
        let url = URL.init(fileURLWithPath: path)
        
        do{
            player = try AVAudioPlayer(contentsOf: url)
            player.prepareToPlay()
        }catch let error as NSError
        {
            print(error.description)
        }
    }

    @IBAction func powerButtonTapped(_ sender: Any) {
        
        cloudsImg.isHidden = false
        rocketImg.isHidden = false
        
        player.play()
        
        UIView.animate(withDuration: 2.3, animations: {
            self.rocketImg.frame = CGRect(x: 85, y: 20, width: 200, height: 300)
        }) { (finished) in
           self.hustleModeOnLbl.isHidden = false
        }
        
        
        
    }
    
}

