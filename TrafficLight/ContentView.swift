    //
    //  ContentView.swift
    //  TrafficLight
    //
    //  Created by Konstantin Fomenkov on 12.05.2022.
    //

import SwiftUI


struct ContentView: View {

    enum ActiveLight {
        case red, yellow, green
    }

    private let lightsOn = 1.0
    private let lightsOff = 0.3
    
    @State private var start = true
    @State private var activeLight = ActiveLight.red

    @State private var redLight = 0.3
    @State private var yellowLight = 0.3
    @State private var greenLight = 0.3

    var body: some View {
        ZStack {
            Color(UIColor.systemGray)
                .ignoresSafeArea()
            VStack {
                lights
                Spacer()
                Button(action: changeLight) {
                    Text(start ? "START" : "NEXT")
                        .frame(width: 200, height: 70)
                        .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.white, lineWidth: 10))
                        .font(.largeTitle .bold())
                        .foregroundColor(.white)
                        .background(.blue)
                        .cornerRadius(20)
                }
            }
            .padding(.vertical, 20)
        }
    }

    private var lights: some View {
        VStack{
            CircleView(color: .red, opacity: redLight)
            CircleView(color: .yellow, opacity: yellowLight)
            CircleView(color: .green, opacity: greenLight)
        }
    }

    private func changeLight() {
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
