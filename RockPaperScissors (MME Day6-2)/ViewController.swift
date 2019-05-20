//
//  ViewController.swift
//  RockPaperScissors (MME Day6-2)
//
//  Created by Patrick Stacey-Vargus on 5/20/19.
//  Copyright © 2019 Patrick Stacey-Vargas. All rights reserved.
//

import UIKit
import SafariServices

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Yeah, at least this part works.")
        // Do any additional setup after loading the view.
    }

    var userChoice = ""
    var choices = ["Rock", "Paper", "Scissors"]
    
    @IBAction func rulesLinkButton(_ sender: UIButton) {
        let settingsUrl = NSURL(string:UIApplication.openSettingsURLString)! as URL
        UIApplication.shared.open(settingsUrl, options: [:], completionHandler: nil)
    
        
    }
    
    @IBAction func paperTap(_ sender: UITapGestureRecognizer) {
        userChoice = "Paper"
        print("Paper")
        deviceChoice()
        winCondition()
        resultsMessage()
        
    }
    
    @IBAction func rockTap(_ sender: UITapGestureRecognizer) {
        userChoice = "Rock"
        print("Rock")
        deviceChoice()
        winCondition()
        resultsMessage()
        
    }
    
    @IBAction func scissorTap(_ sender: UITapGestureRecognizer) {
        userChoice = "Scissors"
        print("Scissors")
        deviceChoice()
        winCondition()
        resultsMessage()
    }

    func deviceChoice () -> String {
        choices.shuffle()
        print(choices[1])
        
        return choices[1]
    }
    
    
    
    
    func winCondition () -> BooleanLiteralType {
        var win = false
        
        if (userChoice == "Scissors" && deviceChoice() == "Paper") || (userChoice == "Rock" && deviceChoice() == "Scissors") || (userChoice == "Paper" && deviceChoice() == "Rock"){
            win = true
            
        }
        
        else if (userChoice == "Scissors" && deviceChoice() == "Rock") || (userChoice == "Rock" && deviceChoice() == "Paper") || (userChoice == "Paper" && deviceChoice() == "Scissors"){
            win = false
        }
        
        else if (userChoice == deviceChoice()){
            let alertDraw = UIAlertController(title: "You Drew?", message: "Let's call it a win.", preferredStyle: .alert)
            let action1 = UIAlertAction(title: "Alright, then", style: .default, handler: nil)
            alertDraw.addAction(action1)
            self.present(alertDraw, animated: true, completion: nil )
        }
        
        return win
    }
    
    
    
    func resultsMessage (){
        if winCondition() == false {
            let alertLoss = UIAlertController(title: "You Lost", message: "Outsmarted again. Looks like the AI are taking over.", preferredStyle: .alert)
            let action1 = UIAlertAction(title: "Well, that sucks", style: .default, handler: nil)
            alertLoss.addAction(action1)
            self.present(alertLoss, animated: true, completion: nil )
        }
        else {
            let alertWin = UIAlertController(title: "You Won!", message: "Congratulations... The AI will only learn from its mistake.", preferredStyle: .alert)
            let action1 = UIAlertAction(title: "Nice", style: .default, handler: nil)
            alertWin.addAction(action1)
            self.present(alertWin, animated: true, completion: nil )
        }
        
        
    }
}

