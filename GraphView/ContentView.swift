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
    Vertex(coordinates: CGPoint(x: 200, y: 500))]
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Rectangle()
                .fill(.white)
                .onTapGesture { location in
                    print(location)
                }
            
      
            Edge(start: vertices[0], end: vertices[1])
                .stroke(.blue)
            Edge(start: vertices[0], end: vertices[2])
                .stroke(.blue)
            Edge(start: vertices[1], end: vertices[2])
                .stroke(.blue)
            Edge(start: vertices[2], end: vertices[3])
                .stroke(.blue)
            Edge(start: vertices[3], end: vertices[4])
                .stroke(.blue)
            
            verticesView
        }
    }
    
    var verticesView: some View {
        ZStack {
            VertexView(vertex: $vertices[0])
                .gesture(DragGesture()
                    .onChanged { value in
                        vertices[0].coordinates = value.location
                    }
                )
            
            VertexView(vertex: $vertices[1])
                .gesture(DragGesture()
                    .onChanged { value in
                        vertices[1].coordinates = value.location
                    }
                )
            
            VertexView(vertex: $vertices[2])
                .gesture(DragGesture()
                    .onChanged { value in
                        vertices[2].coordinates = value.location
                    }
                )
            
            VertexView(vertex: $vertices[3])
                .gesture(DragGesture()
                    .onChanged { value in
                        vertices[3].coordinates = value.location
                    }
                )
            
            VertexView(vertex: $vertices[4])
                .gesture(DragGesture()
                    .onChanged { value in
                        vertices[4].coordinates = value.location
                    }
                )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
