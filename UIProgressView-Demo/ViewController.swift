//
//  ViewController.swift
//  UIProgressView-Demo
//
//  Created by Alan Liu on 2022/01/25.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var progressView: UIProgressView!
    
    @IBOutlet weak var progressLabel: UILabel!
    
    private var progress = Float(0)
    
    private var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(timerUpdate), userInfo: nil, repeats: true)
    }
    
    @IBAction func actionRestart(_ sender: Any) {
        timer.invalidate()
        progress = 0
        progressView.setProgress(progress, animated: false)
        progressLabel.text = "Please wait ..."
        
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(timerUpdate), userInfo: nil, repeats: true)
    }
    
    @objc func timerUpdate() {
        progress = progress + 0.0025
        
        if progress < 1 {
            progressView.setProgress(progress, animated: true)
        } else {
            timer.invalidate()
            progressLabel.text = "Completed!"
        }
    }
}
