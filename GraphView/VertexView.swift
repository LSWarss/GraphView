//
//  VertexView.swift
//  GraphView
//
//  Created by Łukasz Stachnik on 05/09/2022.
//

import SwiftUI

struct VertexView: View {
    var radius: Double
    var color: Color
    var coordinate: CGPoint
    
    var body: some View {
        Circle()
            .fill(color)
            .frame(width: radius * 2, height: radius * 2, alignment: .center)
            .offset(x: coordinate.x - radius, y: coordinate.y - radius)
    }
}

