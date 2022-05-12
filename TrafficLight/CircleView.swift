//
//  CircleView.swift
//  TrafficLight
//
//  Created by Konstantin Fomenkov on 12.05.2022.
//

import SwiftUI

struct CircleView: View {

    var color: Color
    var opacity: Double
    
    var body: some View {
        Circle()
            .foregroundColor(color)
            .opacity(opacity)
            .overlay(Circle().stroke(Color.white, lineWidth: 5))
            .frame(width: 125, height: 125)
            .padding(.bottom, 20)
    }
}
