//
//  ViewController.swift
//  swift_life
//
//  Created by Juan Alonso on 06/06/14.
//  Copyright (c) 2014 Tecnilogica. All rights reserved.
//

import UIKit
import QuartzCore


class ViewController: UIViewController {
    
    
    @IBOutlet weak var lifeCanvas : Life!

    
    override func viewDidLoad() {

        super.viewDidLoad()

    }

    
    
    @IBAction func pushStartButton(sender : AnyObject) {
        
        lifeCanvas.changeWorldStatus()
        
        if lifeCanvas.isRunning {
            sender.setTitle("Stop", forState: .Normal)
        } else {
            sender.setTitle("Start", forState: .Normal)
        }
        
    }
    

    
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent!) {
        if motion == .MotionShake {
            lifeCanvas.seedWorld()
        }
    }
    

    
    
}

