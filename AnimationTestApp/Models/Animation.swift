//
//  Animation.swift
//  AnimationTestApp
//
//  Created by Михаил Иванов on 13.02.2022.
//

struct Animation {
    let preset: String
    let curve: String
    let force: Float
    let duration: Float
    let delay: Float
    
    static func getAnimation() -> Animation {
        let animation = Animation (
            preset: DataManager.shared.presets.randomElement() ?? "",
            curve: DataManager.shared.curves.randomElement() ?? "",
            force: Float.random(in: DataManager.shared.forces),
            duration: Float.random(in: DataManager.shared.durations),
            delay: Float.random(in: DataManager.shared.delays)
        )
        return animation
    }
}
