//
//  BackgroundView.swift
//  Bullseye
//
//  Created by Nestor Pérez on 20/06/24.
//

import SwiftUI

struct BackgroundView: View {
  @Binding var game: Game
  var body: some View {
    VStack {
      HeaderView(game: $game)
      Spacer()
      FooterView(game: $game)
    }.padding()
      .background(RingsView())
      .background(Color("AppBackground"))
  }
}

private struct HeaderView: View {
  @Binding var game: Game
  var body: some View {
    HStack {
      RoundedButton(icon: "arrow.counterclockwise") {
        game.restart()
      }
      Spacer()
      RoundedButton(icon: "list.dash")
    }
  }
}

private struct FooterView: View {
  @Binding var game: Game
  var body: some View {
    HStack {
      StaticRectangleLabeledButton(labelText: "Score", score: game.score)
      Spacer()
      StaticRectangleLabeledButton(labelText: "Round", score: game.round)
    }
  }
}

private struct RingsView : View {
  var body: some View {
    ZStack {
      ForEach(1..<6) { item in
        let size = CGFloat(item * 100)
        Circle()
          .stroke(lineWidth: 20)
          .frame(width: size, height: size)
      }
      .foregroundStyle(
        RadialGradient(colors: [Color("RingsBackground").opacity(0.8), Color("RingsBackground").opacity(0.2)], center: UnitPoint.center, startRadius: 100, endRadius: 300)
      )
    }
  }
}

#Preview {
  BackgroundView(game: .constant(Game()))
}
