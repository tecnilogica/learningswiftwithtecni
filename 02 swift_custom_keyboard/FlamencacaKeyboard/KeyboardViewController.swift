//
//  KeyboardViewController.swift
//  FlamencacaKeyboard
//
//  Created by Juan Alonso on 08/08/14.
//  Copyright (c) 2014 Tecnilogica. All rights reserved.
//

import UIKit

class KeyboardViewController: UIInputViewController {


    
    override func updateViewConstraints() {
        
        super.updateViewConstraints()

        // Esto funcionará algún día
        //var heightConstraint = NSLayoutConstraint(item: self.view, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 0, constant: 84)
        //self.view.addConstraint(heightConstraint)
        
    }

    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        var views = NSBundle.mainBundle().loadNibNamed("KeyboardInterface", owner: self, options: nil)
        var keyboardView = views[0] as UIView
        self.view.addSubview(keyboardView)
        
    }

    
    
    @IBAction func didTapNextKeyboard() {
        advanceToNextInputMode()
    }
    
    
    
    @IBAction func didTapFlamenca() {
        var proxy = textDocumentProxy as UITextDocumentProxy
        proxy.insertText("💃")
    }
    
    
    
    @IBAction func didTapCaca() {
        var proxy = textDocumentProxy as UITextDocumentProxy
        proxy.insertText("💩")
    }
    
    
    
    @IBAction func didTapDelete() {
        var proxy = textDocumentProxy as UITextDocumentProxy
        proxy.deleteBackward()
    }



}
