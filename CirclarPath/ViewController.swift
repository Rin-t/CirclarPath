//
//  ViewController.swift
//  CirclarPath
//
//  Created by Rin on 2021/05/21.
//

import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet weak var animatedCountingLabel: UILabel!
    
    private var circularProgressBarView: CircularProgressBarView!
    private var circularViewDuration: TimeInterval = 10
    private var timer: Timer?
    private var countNumber: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpCircularProgressBarView()
        setUpTimer()
    }
    
    private func setUpTimer() {
        countNumber = 10
        animatedCountingLabel.text = String(countNumber)
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countTimer), userInfo: nil, repeats: true)
    }
    
    @objc func countTimer() {
        print("count")
        countNumber -= 1
        animatedCountingLabel.text = String(countNumber)
        
        if countNumber == 0 {
            timer?.invalidate()
        }
        
    }
    
    private func setUpCircularProgressBarView() {
        // set view
        circularProgressBarView = CircularProgressBarView(frame: .zero)
        circularProgressBarView.createCircularPath()
        // align to the center of the screen
        circularProgressBarView.center = view.center
        // call the animation with circularViewDuration
        circularProgressBarView.progressAnimation(duration: circularViewDuration)
        // add this view to the view controller
        view.addSubview(circularProgressBarView)
    }
    
    
}

