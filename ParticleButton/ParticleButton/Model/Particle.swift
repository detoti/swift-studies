//
//  Particle.swift
//  ParticleButton
//
//  Created by André Toti on 26/04/23.
//

import SwiftUI

    //MARK: Particle Model

struct Particle: Identifiable {
    var id: UUID = .init()
    
    var randomX: CGFloat = 0
    var randomY: CGFloat = 0
    var scale: CGFloat = 1
    
    //MARK: Opacity
    
    var opacity: CGFloat = 1
    
    //MARK: Reset Properties
    mutating func reset() {
        randomX = 0
        randomY = 0
        scale = 1
        opacity = 1
    }
    
}
