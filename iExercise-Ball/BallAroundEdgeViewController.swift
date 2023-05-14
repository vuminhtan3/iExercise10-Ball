//
//  BallAroundEdgeViewController.swift
//  iExercise-Ball
//
//  Created by Minh Tan Vu on 14/05/2023.
//

import UIKit

class BallAroundEdgeViewController: UIViewController {
    
    var timer1: Timer!
    var timer2: Timer!
    var timer3: Timer!
    var timer4: Timer!

    
    @IBOutlet weak var ballView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        ballView.frame = CGRect(x: 10, y: 59 + 10, width: 50, height: 50)
        ballView.layer.cornerRadius = 25

        timer1 = Timer.scheduledTimer(timeInterval: 0.005, target: self, selector: #selector(runTimer1), userInfo: nil, repeats: true)

    }

    @objc func runTimer1() {
        ballView.center.y += 1
        if ballView.frame.origin.y == view.frame.height - ballView.frame.height - 10 {
            timer1.invalidate()
            timer2 = Timer.scheduledTimer(timeInterval: 0.005, target: self, selector: #selector(runTimer2), userInfo: nil, repeats: true)
        }
    }
    @objc func runTimer2() {
        ballView.center.x += 1
        if ballView.frame.origin.x == view.frame.width - ballView.frame.width - 10 {
            timer2.invalidate()
            timer3 = Timer.scheduledTimer(timeInterval: 0.005, target: self, selector: #selector(runTimer3), userInfo: nil, repeats: true)
        }
    }
    @objc func runTimer3() {
        ballView.center.y -= 1
        if ballView.frame.origin.y == 69 {
            timer3.invalidate()
            timer4 = Timer.scheduledTimer(timeInterval: 0.005, target: self, selector: #selector(runTimer4), userInfo: nil, repeats: true)
        }
    }
    @objc func runTimer4() {
        ballView.center.x -= 1
        if ballView.frame.origin.x == 10 {
            timer4.invalidate()
        }
    }
    
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
}
