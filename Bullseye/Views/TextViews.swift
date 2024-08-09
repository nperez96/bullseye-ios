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
      TitleText(text: "🎯🎯🎯")
        .padding(EdgeInsets(top: 0.0, leading: 0.0, bottom: 8.0, trailing: 0.0))
      ExtraTitleText(text: "89")
      DescriptionText(text: "PUT THE BULLSEYE AS CLOSE AS YOU CAN TO")
    }
  }
}

struct ExtraTitleText: View {
  var text: String
  var body: some View {
    Text(text)
      .font(.largeTitle)
      .fontWeight(.black)
      .tracking(-1)
      .foregroundColor(Color("TextColor"))
  }
}

struct GameTarget: View {
  @Binding var game: Game
  
  var body: some View {
    ExtraTitleText(text: String(game.target))
  }
}

struct TitleText: View {
  var text: String
  
  var body: some View {
    Text(text).font(.title)
  }
}

struct DescriptionText: View {
  var text: String
  
  var body: some View {
    Text(text)
      .multilineTextAlignment(.center)
      .bold()
      .kerning(2.0)
      .font(.footnote)
      .foregroundColor(Color("TextColor"))
  }
}

#Preview {
  VStack {
    Instructions()
    TitleText(text: "🎯🎯🎯")
  }
}
