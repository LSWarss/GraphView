//
//  VertexView.swift
//  GraphView
//
//  Created by Łukasz Stachnik on 05/09/2022.
//

import SwiftUI

struct VertexView: View {
    @Binding var vertex: Vertex
    
    var body: some View {
        Circle()
            .fill(vertex.color)
            .frame(width: vertex.radius * 2, height: vertex.radius * 2, alignment: .center)
            .offset(x: vertex.coordinates.x - vertex.radius, y: vertex.coordinates.y - vertex.radius)
    }
}

