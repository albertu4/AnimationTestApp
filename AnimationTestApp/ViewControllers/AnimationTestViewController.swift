//
//  ViewController.swift
//  AnimationTestApp
//
//  Created by Михаил Иванов on 13.02.2022.
//

import Spring

class AnimationTestViewController: UIViewController {
    
    @IBOutlet var animationView: SpringView!
    @IBOutlet var animationStartButton: SpringButton!
    
    @IBOutlet var animationSettingLabels: [UILabel]!
    
    private var animation = Animation.getAnimation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animationView.layer.cornerRadius = 10
        animationStartButton.layer.cornerRadius = 10
        
        animationStartButton.setTitle("Run \(animation.preset)", for: .normal)
        changeLabelsText()
    }

    @IBAction func startAnimation(_ sender: SpringButton) {
        changeAnimationSettings()
        animationView.animate()
        
        animation = Animation.getAnimation()
        changeLabelsText()
        
        sender.animation = "pop"
        sender.setTitle("Run \(animation.preset)", for: .normal)
        sender.animate()
    }
    
    private func changeAnimationSettings() {
        animationView.animation = animation.preset
        animationView.curve = animation.curve
        animationView.force = CGFloat(animation.force)
        animationView.duration = CGFloat(animation.duration)
        animationView.delay = CGFloat(animation.delay)
    }
    
    private func changeLabelsText() {
        animationSettingLabels.forEach {
            switch $0.tag {
            case 0:
                $0.text = "Preset: \(animation.preset)"
            case 1:
                $0.text = "Curve: \(animation.curve)"
            case 2:
                $0.text = "Force: \(String(format: "%.2f", animation.force))"
            case 3:
                $0.text = "Duration: \(String(format: "%.2f", animation.duration))"
            default:
                $0.text = "Delay: \(String(format: "%.2f", animation.duration))"
            }
        }
    }
}

