//
//  emojiGameVC.swift
//  emojiForest
//
//  Created by akbar  Rizvi on 1/29/20.
//  Copyright © 2020 akbar  Rizvi. All rights reserved.
//

import UIKit

class emojiGameVC: UIViewController,UITextFieldDelegate {
    var seconds = 60
    var timer = Timer()
    var checkingTimer = false
    var pause = false
   
    @IBOutlet weak var labelCount: UILabel!
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(emojiGameVC.updateTimer)), userInfo: nil, repeats: true)
    }
    @objc func updateTimer() {
        seconds -= 1     //This will decrement(count down)the seconds.
        timerLabel.text = String(seconds)
    }
    @IBAction func startButtonPressed(_ sender: Any) {
        startTimer()
    }
    @IBAction func pauseButtonPressed(_ sender: UIButton) {
        if self.pause == false {
            timer.invalidate()
            self.pause
                = true
        } else {
            startTimer()
            self.pause = false
        }
        
        
    }
    
    
    @IBAction func resetButtonPressed(_ sender: UIButton) {
        timer.invalidate()
        seconds = 60
        timerLabel.text = String(seconds)
        
    }
    
    
    @IBOutlet weak var timerLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        emojiUiFieldLabel.delegate = self
        
    }
    
    @IBAction func cancelButtonPressed(_ sender: UIButton) {
         
    }
    
    
    @IBOutlet weak var emojiUiFieldLabel: UITextField!
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if(textField == emojiUiFieldLabel){
            let strLength = textField.text?.count ?? 0
            let lngthToAdd = string.count
            let lengthCount = strLength + lngthToAdd
            print(lengthCount)
            self.labelCount.text = "\(lengthCount)"
            
           
            
        }
        return true
        
        
    }
    
}

