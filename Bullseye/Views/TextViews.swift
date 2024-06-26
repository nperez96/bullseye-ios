//
//  TextViews.swift
//  Bullseye
//
//  Created by Nestor Pérez on 17/06/24.
//
import SwiftUI

struct Instructions: View {
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
        .foregroundColor(Color("TextColor"))
    }
  }
}

struct GameTarget: View {
  @Binding var game: Game
  
  var body: some View {
    Text(String(game.target))
      .font(.largeTitle)
      .fontWeight(.black)
      .tracking(-1)
      .foregroundColor(Color("TextColor"))
  }
}

#Preview {
  VStack {
    Instructions()
  }
}
