//
//  FreeFallBallViewController.swift
//  iExercise-Ball
//
//  Created by Minh Tan Vu on 15/05/2023.
//

import UIKit

class FreeFallBallViewController: UIViewController {
    
    var timer1: Timer!
    var timer2: Timer!
    var currentPosition: CGPoint!
    
    @IBOutlet weak var ballView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currentPosition = CGPoint(x: view.bounds.midX, y: 200)
        ballView.frame = CGRect(x: currentPosition.x - 25 , y: 69, width: 50, height: 50)
        ballView.layer.cornerRadius = 25
        timer1 = Timer.scheduledTimer(timeInterval: 0.003, target: self, selector: #selector(runTimer1), userInfo: nil, repeats: true)
    }
    
    @objc func runTimer1() {
        ballView.frame.origin.y += 1
        if ballView.frame.origin.y >= view.bounds.height - ballView.bounds.height - 10 {
            timer1.invalidate()
            timer2 = Timer.scheduledTimer(timeInterval: 0.003, target: self, selector: #selector(runTimer2), userInfo: nil, repeats: true)
        }
    }
    @objc func runTimer2() {
        ballView.frame.origin.y -= 1
        if ballView.frame.origin.y <= currentPosition.y + 50 {
            currentPosition.y += 100
            timer2.invalidate()
            timer1 = Timer.scheduledTimer(timeInterval: 0.003, target: self, selector: #selector(runTimer1), userInfo: nil, repeats: true)
        }
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
}
