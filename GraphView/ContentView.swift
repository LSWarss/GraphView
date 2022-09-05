//
//  ContentView.swift
//  GraphView
//
//  Created by Łukasz Stachnik on 05/09/2022.
//

import SwiftUI

struct ContentView: View {
    @State var vertices = [CGPoint(x: 40, y: 50), CGPoint(x: 320, y: 50), CGPoint(x: 160, y: 300), CGPoint(x: 160, y: 320)]
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var degrees = 0.0
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Rectangle()
                .fill(.white)
                .onTapGesture { location in
                    print(location)
                }
            
      
            Edge(start: vertices[0], end: vertices[1])
                .stroke()
            Edge(start: vertices[0], end: vertices[2])
                .stroke()
            Edge(start: vertices[1], end: vertices[2])
                .stroke()
            Edge(start: vertices[2], end: vertices[3])
                .stroke()
            
            VertexView(radius: 20,
                       color: .black,
                       coordinate: vertices[0])
            .gesture(DragGesture()
                .onChanged { value in
                    vertices[0] = value.location
                }
            )
            
            VertexView(radius: 20,
                       color: .orange,
                       coordinate: vertices[1])
            .gesture(DragGesture()
                .onChanged { value in
                    vertices[1] = value.location
                }
            )
            
            VertexView(radius: 20,
                       color: .blue,
                       coordinate: vertices[2])
            .gesture(DragGesture()
                .onChanged { value in
                    vertices[2] = value.location
                }
            )
            
            VertexView(radius: 30,
                       color: .pink,
                       coordinate: vertices[3])
            .gesture(DragGesture()
                .onChanged { value in
                    vertices[3] = value.location
                }
            )
        }
        .rotationEffect(Angle(degrees: degrees))
        .onReceive(timer) { input in
            withAnimation {
                degrees += 10
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
