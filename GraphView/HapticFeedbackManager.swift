//
//  HapticFeedbackManager.swift
//  GraphView
//
//  Created by Łukasz Stachnik on 07/09/2022.
//

import Foundation
import UIKit

enum HapticFeedbackKind {
    case light
    case medium
    case heavy
}

final class HapticFeedbackManager {
    
    static let shared = HapticFeedbackManager()
    
    private let lightImpact = UIImpactFeedbackGenerator(style: .light)
    private let mediumImpact = UIImpactFeedbackGenerator(style: .medium)
    private let heavyImpact =  UIImpactFeedbackGenerator(style: .heavy)
    
    func triggerImpact(_ kind: HapticFeedbackKind) {
        switch kind {
        case .light:
            lightImpact.impactOccurred()
        case .medium:
            mediumImpact.impactOccurred()
        case .heavy:
            heavyImpact.impactOccurred()
        }
    }
}
