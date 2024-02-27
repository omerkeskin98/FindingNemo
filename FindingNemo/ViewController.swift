//
//  ViewController.swift
//  FindingNemo
//
//  Created by Omer Keskin on 14.02.2024.
//

import UIKit

class ViewController: UIViewController {
    
    var score = 0
    
    var timer = Timer()
    var counter = 0
    
    var hideTimer = Timer()
    
    var highScore = 0
    
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var highScoreLabel: UILabel!
    @IBOutlet weak var nemo1: UIImageView!
    @IBOutlet weak var nemo2: UIImageView!
    @IBOutlet weak var nemo3: UIImageView!
    @IBOutlet weak var nemo4: UIImageView!
    @IBOutlet weak var nemo5: UIImageView!
    @IBOutlet weak var nemo6: UIImageView!
    @IBOutlet weak var nemo7: UIImageView!
    @IBOutlet weak var nemo8: UIImageView!
    @IBOutlet weak var nemo9: UIImageView!
    @IBOutlet weak var nemo10: UIImageView!
    @IBOutlet weak var nemo11: UIImageView!
    @IBOutlet weak var nemo12: UIImageView!
    @IBOutlet weak var nemo13: UIImageView!
    @IBOutlet weak var nemo14: UIImageView!
    @IBOutlet weak var nemo15: UIImageView!
    @IBOutlet weak var nemo16: UIImageView!
    
    var nemoArray = [UIImageView]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scoreLabel.text = "Score: \(score)"
        
        let savedHighScore = UserDefaults.standard.object(forKey: "highScore")
        
        if savedHighScore == nil{
            
            highScore = 0
            highScoreLabel.text = "High Score: \(highScore)"
        }
        
        if let newHighScore = savedHighScore as? Int{
            
            highScore = newHighScore
            highScoreLabel.text = "High Score: \(highScore)"
        }
        
        
        
        nemo1.isUserInteractionEnabled = true
        nemo2.isUserInteractionEnabled = true
        nemo3.isUserInteractionEnabled = true
        nemo4.isUserInteractionEnabled = true
        nemo5.isUserInteractionEnabled = true
        nemo6.isUserInteractionEnabled = true
        nemo7.isUserInteractionEnabled = true
        nemo8.isUserInteractionEnabled = true
        nemo9.isUserInteractionEnabled = true
        nemo10.isUserInteractionEnabled = true
        nemo11.isUserInteractionEnabled = true
        nemo12.isUserInteractionEnabled = true
        nemo13.isUserInteractionEnabled = true
        nemo14.isUserInteractionEnabled = true
        nemo15.isUserInteractionEnabled = true
        nemo16.isUserInteractionEnabled = true
        
        let recognizer1 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer2 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer3 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer4 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer5 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer6 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer7 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer8 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer9 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer10 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer11 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer12 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer13 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer14 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer15 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer16 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        
        
        nemo1.addGestureRecognizer(recognizer1)
        nemo2.addGestureRecognizer(recognizer2)
        nemo3.addGestureRecognizer(recognizer3)
        nemo4.addGestureRecognizer(recognizer4)
        nemo5.addGestureRecognizer(recognizer5)
        nemo6.addGestureRecognizer(recognizer6)
        nemo7.addGestureRecognizer(recognizer7)
        nemo8.addGestureRecognizer(recognizer8)
        nemo9.addGestureRecognizer(recognizer9)
        nemo10.addGestureRecognizer(recognizer10)
        nemo11.addGestureRecognizer(recognizer11)
        nemo12.addGestureRecognizer(recognizer12)
        nemo13.addGestureRecognizer(recognizer13)
        nemo14.addGestureRecognizer(recognizer14)
        nemo15.addGestureRecognizer(recognizer15)
        nemo16.addGestureRecognizer(recognizer16)
        
        
        nemoArray = [nemo1, nemo2, nemo3, nemo4, nemo5, nemo6, nemo7, nemo8, nemo9, nemo10, nemo11, nemo12, nemo13, nemo14, nemo15, nemo16]
        
        
        counter = 10
        timeLabel.text = String(counter)
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countDown), userInfo: nil, repeats: true)
        
        hideTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(hideNemo), userInfo: nil, repeats: true)
        
        hideNemo()
        
    }
    
    
    @objc func hideNemo(){
        
        for nemo in nemoArray{
            nemo.isHidden = true
        }
        let random = Int(arc4random_uniform(UInt32(nemoArray.count - 1)))
        nemoArray[random].isHidden = false
        
    }
    
    @objc func increaseScore(){
        
        score += 1
        scoreLabel.text = "Score: \(score)"
        
    }
    
    @objc func countDown(){
        
        counter = counter - 1
        timeLabel.text = String(counter)
        
        if counter == 0{
            timer.invalidate()
            hideTimer.invalidate()
            
            for nemo in nemoArray{
                nemo.isHidden = true
                
                
            
            // highScore
                
                if self.score > self.highScore{
                    
                    self.highScore = self.score
                    
                    highScoreLabel.text = "High Score: \(self.highScore)"
                    UserDefaults.standard.set(self.highScore, forKey: "highScore")
                    
                }
                
                let timeOver = UIAlertController(title: "Time Over", message: "Play Again?", preferredStyle: UIAlertController.Style.alert)
                
                let exitButton = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil)
                
                let replayButton = UIAlertAction(title: "Replay", style: UIAlertAction.Style.default) { [self] UIAlertAction in
                    //replay func
                    
                    self.score = 0
                    self.counter = 10
                    self.scoreLabel.text = "Score: \(self.score)"
                    self.timeLabel.text = String(self.counter)
                    
                    self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.countDown), userInfo: nil, repeats: true)
                    
                    self.hideTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(self.hideNemo), userInfo: nil, repeats: true)
                    
                }
                
                
                timeOver.addAction(exitButton)
                timeOver.addAction(replayButton)
                self.present(timeOver, animated: true, completion: nil)
                
                
                
                
            }
            
            
        }
        
        
        
        
    }
    
}
