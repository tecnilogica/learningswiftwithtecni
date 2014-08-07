//
//  KeyboardViewController.swift
//  VMKeyboard
//
//  Created by Juan Alonso on 07/08/14.
//  Copyright (c) 2014 Tecnilogica. All rights reserved.
//
//  Nuevo teclado
//  Basado en 
//  http://verisage.us/en/blog/2014/07/17/ios-8-custom-keyboard-swift-tutorial/ 
//  y en
//  http://www.weheartswift.com/make-custom-keyboard-ios-8-using-swift/

import UIKit

class KeyboardViewController: UIInputViewController {

    
    
    @IBOutlet weak var nextKeyboardButton: UIButton!
    var customInterface: UIView!

    
    
    init(nibName nibNameOrNil: String!, bundle nibBundleOrNil: NSBundle!) {
        
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        var nib = UINib(nibName: "KeyboardInterface", bundle: nil)
        let objects = nib.instantiateWithOwner(self, options: nil)
        customInterface = objects[0] as UIView
        
    }
    
    
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
    }


    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(customInterface)
    }

    
    
    @IBAction func didTapNextKeyboard() {
        advanceToNextInputMode()
    }
    

    
    @IBAction func didTapVerder() {
        var proxy = textDocumentProxy as UITextDocumentProxy
        proxy.insertText("🌿")
    }


    
    @IBAction func didTapMierder() {
        var proxy = textDocumentProxy as UITextDocumentProxy
        proxy.insertText("💩")
    }

    
    
    @IBAction func didTapDelete() {
        var proxy = textDocumentProxy as UITextDocumentProxy
        proxy.deleteBackward()
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    
    override func textWillChange(textInput: UITextInput) {
    }

    
    
    override func textDidChange(textInput: UITextInput) {
    }

    
}
