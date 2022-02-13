//
//  ViewController.swift
//  AnimationTestApp
//
//  Created by Михаил Иванов on 13.02.2022.
//

import Spring

class AnimationTestViewController: UIViewController {
    
    private var animation = Animation.getAnimation()

    @IBOutlet var animationView: SpringView!
    
    @IBOutlet var presetLabel: UILabel!
    @IBOutlet var curveLabel: UILabel!
    @IBOutlet var forceLabel: UILabel!
    @IBOutlet var durationLabel: UILabel!
    @IBOutlet var delayLabel: UILabel!
    
    @IBOutlet var animationStartButton: SpringButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animationView.layer.cornerRadius = 10
        animationStartButton.layer.cornerRadius = 10
        
        animationStartButton.setTitle(animation.preset, for: .normal)
    }

    @IBAction func startAnimationButton(_ sender: SpringButton) {
        animationView.animation = animation.preset
        animationView.curve = animation.curve
        animationView.force = CGFloat(animation.force)
        animationView.duration = CGFloat(animation.duration)
        animationView.delay = CGFloat(animation.delay)
        changeLabelText()
        animationView.animate()
        
        animation = Animation.getAnimation()
        
        sender.animation = "pop"
        sender.setTitle(animation.preset, for: .normal)
        sender.animate()
        
        
    }
    
    private func changeLabelText() {
        presetLabel.text = "Preset: \(animation.preset)"
        curveLabel.text = "Curve: \(animation.curve)"
        forceLabel.text = "Force: \(String(format: "%.2f", animation.force))"
        durationLabel.text = "Duration: \(String(format: "%.2f", animation.duration))"
        delayLabel.text = "Delay: \(String(format: "%.2f", animation.duration))"
    }
}

