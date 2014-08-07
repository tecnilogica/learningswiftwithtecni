//
//  Life.swift
//  swift_life
//
//  Created by Juan Alonso on 06/06/14.
//  Copyright (c) 2014 Tecnilogica. All rights reserved.
//

import UIKit
import QuartzCore



class Life: UIView {
    
    
    
    //Width and Height of the world. Harcoded
    let (worldW, worldH) = (40,UIScreen.mainScreen().bounds.height == 480 ? 51 : 62)
    let cellSize:CGFloat = 8.0
    
    //Arrays to store the current world
    var currentWorld: [Int8]
    
    //Time related data
    var isRunning: Bool
    var ticker: NSTimer

    
    
    init(coder aDecoder: NSCoder!)  {

        //Initialize world arrays
        currentWorld = [Int8](count: worldW * worldH, repeatedValue: 0)
        
        //The world is frozen
        isRunning = false
        ticker = NSTimer()
        
        //Initialize the view
        super.init(coder: aDecoder)
        
        //Fill current world with random data
        seedWorld()
        
    }
    
    
    
    //Function to seed the world
    func seedWorld() {
        for f in 0..<worldW * worldH {
            currentWorld[f] = Int8(arc4random()%2)
        }
        self.setNeedsDisplay()
    }
    
    
    
    //Freeze / unfreeze the world
    //TODO: make a better animation loop
    func changeWorldStatus() {

        isRunning = !isRunning
        
        if isRunning {
            ticker = NSTimer.scheduledTimerWithTimeInterval(0.06, target: self, selector: "generation", userInfo: nil, repeats: true)
        } else {
            ticker.invalidate()
            
        }

    }
    
    
    
    //Function to calculate the amount of alive neighbours one cell has
    //No optimization going on here
    func neighbourCellState (x: Int, y:Int) -> Int8 {
        
        var adjustedX: Int, adjustedY: Int
        
        switch x {
        case -1: adjustedX = worldW  - 1
        case worldW : adjustedX = 0
        default: adjustedX = x
        }
        
        switch y {
        case -1: adjustedY = worldH  - 1
        case worldH : adjustedY = 0
        default: adjustedY = y
        }
        
        return currentWorld[adjustedX + adjustedY * worldW]
    }
    
    
    
    //Calculate next generation
    func generation() {
        
        //println("init generation")

        let currentTime = CACurrentMediaTime()
        var futureWorld = [Int8](count: worldW * worldH, repeatedValue: 0)
        
        var index = 0
        
        for y in 0..<worldH {
            
            for x in 0..<worldW {
                
                var neighbours = neighbourCellState(x-1,y:y-1) +
                    neighbourCellState(x,y:y-1) +
                    neighbourCellState(x+1,y:y-1) +
                    neighbourCellState(x-1,y:y) +
                    neighbourCellState(x+1,y:y) +
                    neighbourCellState(x-1,y:y+1) +
                    neighbourCellState(x,y:y+1) +
                    neighbourCellState(x+1,y:y+1)
                
                if neighbours == 2 {
                    futureWorld[index] = currentWorld[index]
                } else if neighbours == 3 {
                    futureWorld[index] = 1
                }
                
                index++
                
            }
            
        }

        println("finish generation \(CACurrentMediaTime()-currentTime)")
        currentWorld = futureWorld
        self.setNeedsDisplay()

    }
    
    
    
    //Repaints the world view
    override func drawRect(rect: CGRect) {
        
        var context = UIGraphicsGetCurrentContext();
        
        CGContextSetRGBFillColor(context, 189/255, 195/255, 199/255, 1.0);
        
        for y in 0..<worldH {
            
            for x in 0..<worldW {
                
                if currentWorld[x + y * worldW]==1 {
                    var rectangle = CGRectMake(cellSize*CGFloat(x),cellSize*CGFloat(y), cellSize, cellSize)
                    CGContextFillRect(context, rectangle);
                    
                }

            }
        
        }
    
    }

    
    
}


