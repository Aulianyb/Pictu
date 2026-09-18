//
//  SealShape.swift
//  Pictu
//
//  Created by Aulia Nadhirah Yasmin Badrulkamal on 16/09/26.
//

import SwiftUI

struct SealShape: Shape {
    var points: Int = 20
    var innerRadiusRatio: CGFloat = 0.85

    func path(in rect: CGRect) -> Path {
        var path = Path()
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let outerRadius = min(rect.width, rect.height) / 2
        let innerRadius = outerRadius * innerRadiusRatio

        let totalPoints = points * 2
        let angleStep = (2 * CGFloat.pi) / CGFloat(totalPoints)

        var vertices: [CGPoint] = []
        for i in 0..<totalPoints {
            let angle = angleStep * CGFloat(i) - .pi / 2
            let radius = i % 2 == 0 ? outerRadius : innerRadius
            vertices.append(CGPoint(
                x: center.x + radius * cos(angle),
                y: center.y + radius * sin(angle)
            ))
        }

        path.move(to: midpoint(vertices[vertices.count - 1], vertices[0]))
        for i in 0..<vertices.count {
            let next = vertices[(i + 1) % vertices.count]
            let mid = midpoint(vertices[i], next)
            path.addQuadCurve(to: mid, control: vertices[i])
        }
        path.closeSubpath()
        return path
    }

    private func midpoint(_ a: CGPoint, _ b: CGPoint) -> CGPoint {
        CGPoint(x: (a.x + b.x) / 2, y: (a.y + b.y) / 2)
    }
}
