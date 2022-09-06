//
//  EdgeShape.swift
//  GraphView
//
//  Created by Łukasz Stachnik on 05/09/2022.
//

import SwiftUI

struct Edge: Shape {
    
    let start: Vertex
    let end: Vertex
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: start.coordinates)
        path.addLine(to: end.coordinates)
        return path
    }
}
