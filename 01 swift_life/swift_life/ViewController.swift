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
    
    
    
    var lifeCanvas:Life = Life()
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.view.addSubview(lifeCanvas)
        
    }

    
    
    @IBAction func pushStartButton(sender : AnyObject) {
        
        lifeCanvas.changeWorldStatus()
        
        if lifeCanvas.isRunning {
            sender.setTitle("Stop", forState: UIControlState.Normal)
        } else {
            sender.setTitle("Start", forState: UIControlState.Normal)
        }
        
    }
    

    
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent!) {
        if motion == UIEventSubtype.MotionShake {
            lifeCanvas.seedWorld()
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    
}

