    //
    //  CircleView.swift
    //  TrafficLight
    //
    //  Created by Konstantin Fomenkov on 12.05.2022.
    //

import SwiftUI

struct CircleView: View {
    
    let color: Color
    let opacity: Double
    
    var body: some View {
        Circle()
            .foregroundColor(color)
            .opacity(opacity)
            .overlay(Circle().stroke(Color.white, lineWidth: 5))
            .frame(width: 120, height: 120)
            .padding(.bottom, 10)
    }
}
