//
//  ChangeColorButton.swift
//  TrafficLight
//
//  Created by Konstantin Fomenkov on 13.06.2022.
//

import SwiftUI

struct ChangeColorButton: View {
    let title: String
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.title .weight(.heavy))
                .foregroundColor(.white)
        }
        .frame(width: 150, height: 60)
        .background(.blue)
        .cornerRadius(20)
        .overlay(RoundedRectangle(cornerRadius: 20)
            .stroke(Color.white, lineWidth: 4))
    }
}

struct ChangeColorButton_Previews: PreviewProvider {
    static var previews: some View {
        ChangeColorButton(title: "START", action: {} )
    }
}
