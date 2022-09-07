//
//  EdgeShape.swift
//  GraphView
//
//  Created by Łukasz Stachnik on 05/09/2022.
//

import SwiftUI

typealias Coordinates = CGPoint

struct Edge {
    let start: Coordinates
    let end: Coordinates
}

struct EdgeShape: Shape {
    
    let edge: Edge
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: edge.start)
        path.addLine(to: edge.end)
        return path
    }
}
