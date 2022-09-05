//
//  EdgeShape.swift
//  GraphView
//
//  Created by Łukasz Stachnik on 05/09/2022.
//

import SwiftUI

struct Edge: Shape {
    
    let start: CGPoint
    let end: CGPoint
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: start)
        path.addLine(to: end)
        return path
    }
}
