//
//  ViewController.swift
//  MegzMugz
//
//  Created by Rohan Mengle on 8/16/21.
// Note: only use on iPhone 11 or similar screen size

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer?
    var timer = Timer()
    var qB = QuestionsBrain()
    let sounds = Sounds()
    
    // IBOutlets
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var choiceOne: UIButton!
    @IBOutlet weak var choiceTwo: UIButton!
    
    
    // view did load
    override func viewDidLoad() {
        super.viewDidLoad()
        scoreLabel.text = "Score: \(qB.score)"
        questionLabel.text = qB.questions[qB.questionTracker].q
        progressBar.progress = qB.progress()
        choiceOne.setTitle(qB.questions[qB.questionTracker].choice1, for: .normal)
        choiceTwo.setTitle(qB.questions[qB.questionTracker].choice2, for: .normal)
        
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let currentQuestion = qB.questions[qB.questionTracker]
        
        qB.whenAnswerButtonPressed(userChoice: sender.currentTitle!)
        
        if sender.currentTitle! == currentQuestion.truth {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
        qB.restart()
    }
    
    @objc func updateUI() {
        let currentQuestion = qB.questions[qB.questionTracker]
        scoreLabel.text = "Score: \(qB.score)"
        progressBar.progress = qB.progress()
        questionLabel.text = currentQuestion.q
        choiceOne.setTitle(currentQuestion.choice1, for: .normal)
        choiceTwo.setTitle(currentQuestion.choice2, for: .normal)
        choiceOne.backgroundColor = UIColor.clear
        choiceTwo.backgroundColor = UIColor.clear
    }
    
    
    // sound button
    @IBAction func soundButtonPressed(_ sender: UIButton) {
        let url = Bundle.main.url(forResource: sounds.sounds.randomElement(), withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player?.play()
    }
    
    
    
}

