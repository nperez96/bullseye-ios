//
//  ContentView.swift
//  Bullseye
//
//  Created by Nestor Pérez on 04/06/24.
//

import SwiftUI

struct ContentView: View {
  @State private var isAlertVisible: Bool = false
  @State private var sliderValue: Double = 50.0
  var body: some View {
    VStack {
      Text("🎯🎯🎯")
        .padding(EdgeInsets(top: 0.0, leading: 0.0, bottom: 8.0, trailing: 0.0))
        .font(.title)
      Text("PUT THE BULLSEYE AS CLOSE AS YOU CAN TO")
        .multilineTextAlignment(.center)
        .bold()
        .kerning(2.0)
        .font(.footnote)
      Text("89")
        .font(.largeTitle)
        .fontWeight(.black)
        .tracking(-1)
      HStack {
        Text("0")
          .bold()
        Slider(value: $sliderValue, in: 0.0...100.0)
        Text("100")
          .bold()
      }
      Button("HIT ME") {
        isAlertVisible = true
      }
      .alert("Hello World!", isPresented: $isAlertVisible, actions: {
        Button("Awesome") {}
      }, message: {
        var roundedValue = Int(sliderValue.rounded())
        Text("The slider's value is \(roundedValue)")
      })
    }
  }
}

#Preview {
  ContentView()
}
