    //
    //  ContentView.swift
    //  TrafficLight
    //
    //  Created by Konstantin Fomenkov on 12.05.2022.
    //

import SwiftUI


struct ContentView: View {

    @State private var start = true
    @State private var activeLight = ActiveLight.red

    @State private var redLight = 0.3
    @State private var yellowLight = 0.3
    @State private var greenLight = 0.3

    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            VStack {
                CircleView(color: .red, opacity: redLight)
                CircleView(color: .yellow, opacity: yellowLight)
                CircleView(color: .green, opacity: greenLight)
                Spacer()
                ChangeColorButton(
                    title: start ? "START" : "NEXT",
                    action: changeLight)
            }
            .padding(.vertical, 16)
        }
    }

    private func changeLight() {
        let lightsOn = 1.0
        let lightsOff = 0.3

        start = false
        switch activeLight {
        case .red:
            redLight = lightsOn
            greenLight = lightsOff
            activeLight = .yellow
        case .yellow:
            yellowLight = lightsOn
            redLight = lightsOff
            activeLight = .green
        case .green:
            greenLight = lightsOn
            yellowLight = lightsOff
            activeLight = .red
        }
    }
}

extension ContentView {

    enum ActiveLight {
        case red, yellow, green
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
