    //
    //  ContentView.swift
    //  TrafficLight
    //
    //  Created by Konstantin Fomenkov on 12.05.2022.
    //

import SwiftUI

struct ContentView: View {

    @State private var buttonTitle = "START"
    @State private var activeLight = ActiveLight.none

    private let lightOn = 1.0
    private let lightOff = 0.3

    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            VStack {
                CircleView(color: .red, opacity: activeLight == .red ? lightOn : lightOff)
                CircleView(color: .yellow, opacity: activeLight == .yellow ? lightOn : lightOff)
                CircleView(color: .green, opacity: activeLight == .green ? lightOn : lightOff)
                Spacer()

                ChangeColorButton(title: buttonTitle) {
                    if buttonTitle == "START" {
                        buttonTitle = "NEXT"
                    }
                    changeLight()
                }
            }
            .padding(.vertical, 16)
        }
        .onTapGesture {
            activeLight = .none
            buttonTitle = "START"
        }
    }
}

extension ContentView {

    private enum ActiveLight {
        case red, yellow, green, none
    }

    private func changeLight() {
        switch activeLight {
        case .red: activeLight = .yellow
        case .yellow: activeLight = .green
        case .green: activeLight = .red
        case .none: activeLight = .red
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
