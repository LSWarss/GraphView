//
//  ContentView.swift
//  GraphView
//
//  Created by Łukasz Stachnik on 05/09/2022.
//

import SwiftUI

struct Vertex: Identifiable {
    var coordinates: CGPoint
    let id = UUID()
    var isBeingMoved = false
    var color: Color = .black
    var radius: Double = 20
}

struct ContentView: View {
    @State var vertices = [Vertex(coordinates: CGPoint(x: 40, y: 50), color: .blue),
                           Vertex(coordinates: CGPoint(x: 320, y: 50), color: .orange),
                           Vertex(coordinates: CGPoint(x: 160, y: 300), color: .yellow),
                           Vertex(coordinates: CGPoint(x: 160, y: 400), color: .indigo),
                           Vertex(coordinates: CGPoint(x: 200, y: 500), color: .pink)]
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            
            EdgeShape(edge: Edge(start: vertices[0].coordinates,
                                 end: vertices[1].coordinates))
            .stroke()
            
            EdgeShape(edge: Edge(start: vertices[0].coordinates,
                                 end: vertices[2].coordinates))
            .stroke()
            
            EdgeShape(edge: Edge(start: vertices[1].coordinates,
                                 end: vertices[2].coordinates))
            .stroke()
            
            EdgeShape(edge: Edge(start: vertices[2].coordinates,
                                 end: vertices[3].coordinates))
            .stroke()
            
            EdgeShape(edge: Edge(start: vertices[3].coordinates,
                                 end: vertices[4].coordinates))
            .stroke()
            verticesView
        }
    }
    
    var verticesView: some View {
        ZStack {
            ForEach(Array(zip(vertices.indices, $vertices)), id: \.0) { index, vertex in
                VertexView(vertex: vertex)
                    .gesture(DragGesture()
                        .onChanged { value in
                            vertices[index].isBeingMoved = true
                            vertices[index].coordinates = value.location
                        }
                        .onEnded { _ in
                            withAnimation {
                                vertices[index].isBeingMoved = false
                                HapticFeedbackManager.shared.triggerImpact(.light)
                            }
                        }
                    )
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
