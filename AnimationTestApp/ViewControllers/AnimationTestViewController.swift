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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func startAnimationButton(_ sender: SpringButton) {
        animationView.animation = animation.preset
        animationView.curve = animation.curve
        animationView.force = CGFloat(animation.force)
        animationView.duration = CGFloat(animation.duration)
        animationView.delay = CGFloat(animation.delay)
        animationView.animate()
        
        sender.animation = "pop"
        sender.force = 0.1
        sender.animate()
        
        animation = Animation.getAnimation()
    }
    
}

