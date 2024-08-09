//
//  ScoreDialogV.swift
//  Bullseye
//
//  Created by Nestor Pérez on 03/07/24.
//

import SwiftUI

struct ScoreDialogView: View {
  @Binding var sliderValue: Double
  @Binding var game: Game
  var onDismiss: () -> Void
  
  var body: some View {
    ZStack {
      VStack {
        DescriptionText(text: "The slider value is".uppercased())
        ExtraTitleText(text: sliderValue.rounded().formatted())
        let score = game.points(sliderValue: sliderValue)
        Text("You scored \(score) Points").bold()
        TitleText(text: "🎉🎉🎉")
        Button(action: {
          onAction()
        }, label: {
          Text("Start New Round")
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            .padding(12)
            .background(Color("AccentColor"))
            .foregroundColor(Color.white)
            .bold()
            .font(.title3)
            .lineSpacing(16)
            .cornerRadius(12)
        })
      }
      ZStack(content: {
        Button(action: {
          onAction()
        }, label: {
          Image(systemName: "xmark")
        }).frame(width: 45, height: 45)
          .foregroundColor(Color("ButtonForegroundColor"))
          .background(Color("ButtonBackgroundColor"))
          .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
      })
      .padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))
      .frame(width: 315, height: 250, alignment: .topTrailing)
    }
    .frame(width: 315, height: 250)
    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
    .background(Color("AppBackgroundWhite"))
    .cornerRadius(21.0)
  }
  
  func onAction() {
    game.startNewRound(score: game.points(sliderValue: sliderValue))
    onDismiss()
  }
}

#Preview {
  ZStack {
    ScoreDialogView(sliderValue: .constant(20.59), game: .constant(Game())) {}
  }
}
