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
  @State private var game = Game()
  var body: some View {
    ZStack {
      BackgroundView(game: $game)
        .ignoresSafeArea()
      VStack {
        Header(game: $game)
          .padding(Edge.Set.bottom, 100)
        HitmeButton {
          isAlertVisible = true
        }
      }.padding()
      SliderView(sliderValue: $sliderValue)
      if (isAlertVisible) {
        ScoreDialogView(sliderValue: $sliderValue, game: $game) {
          isAlertVisible = false
        }
      }
    }
  }
}

struct Header: View {
  @Binding var game: Game

  var body: some View {
    VStack {
      Instructions()
      GameTarget(game: $game)
    }
  }
}

#Preview {
  ContentView()
}
