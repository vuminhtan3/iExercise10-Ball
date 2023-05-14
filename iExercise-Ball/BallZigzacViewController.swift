//
//  BallZigzacViewController.swift
//  iExercise-Ball
//
//  Created by Minh Tan Vu on 14/05/2023.
//

import UIKit

class BallZigzacViewController: UIViewController {

    var timer1: Timer!
    var timer2: Timer!
    var timer3: Timer!
    var timer4: Timer!
    var timer5: Timer!
    var timer6: Timer!
    var timer7: Timer!
    
    let radius = 50
    
    @IBOutlet weak var ballView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        ballView.frame = CGRect(x: 10, y: 69, width: radius, height: radius)
        ballView.layer.cornerRadius = CGFloat(radius/2)
        
        timer1 = Timer.scheduledTimer(timeInterval: 0.005, target: self, selector: #selector(runTimer1), userInfo: nil, repeats: true)
        
    }
    
    @objc func runTimer1() {
        ballView.frame.origin.x += 1
        if ballView.frame.origin.x >= view.bounds.width - CGFloat(radius) - 10 {
            timer1.invalidate()
            timer2 = Timer.scheduledTimer(timeInterval: 0.005, target: self, selector: #selector(runTimer2), userInfo: nil, repeats: true)
        }
    }
    @objc func runTimer2() {
        ballView.frame.origin.y += 1
        if ballView.frame.origin.y >= view.bounds.height/3 {
            timer2.invalidate()
            timer3 = Timer.scheduledTimer(timeInterval: 0.005, target: self, selector: #selector(runTimer3), userInfo: nil, repeats: true)
        }
    }
    @objc func runTimer3() {
        ballView.frame.origin.x -= 1
        if ballView.frame.origin.x <= 10 {
            timer3.invalidate()
            timer4 = Timer.scheduledTimer(timeInterval: 0.005, target: self, selector: #selector(runTimer4), userInfo: nil, repeats: true)
        }
    }
    @objc func runTimer4() {
        ballView.frame.origin.y += 1
        if ballView.frame.origin.y >= view.bounds.height*2/3 {
            timer4.invalidate()
            timer5 = Timer.scheduledTimer(timeInterval: 0.005, target: self, selector: #selector(runTimer5), userInfo: nil, repeats: true)
        }
    }
    @objc func runTimer5() {
        ballView.frame.origin.x += 1
        if ballView.frame.origin.x >= view.bounds.width - CGFloat(radius) - 10 {
            timer5.invalidate()
            timer6 = Timer.scheduledTimer(timeInterval: 0.005, target: self, selector: #selector(runTimer6), userInfo: nil, repeats: true)
        }
    }
    @objc func runTimer6() {
        ballView.frame.origin.y += 1
        if ballView.frame.origin.y >= view.bounds.height - CGFloat(radius) - 10 {
            timer6.invalidate()
            timer7 = Timer.scheduledTimer(timeInterval: 0.005, target: self, selector: #selector(runTimer7), userInfo: nil, repeats: true)
        }
    }
    @objc func runTimer7() {
        ballView.frame.origin.x -= 1
        if ballView.frame.origin.x <= 10 {
            timer7.invalidate()
        }
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
}
