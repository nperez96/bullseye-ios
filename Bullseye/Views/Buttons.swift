//
//  HitmeButton.swift
//  Bullseye
//
//  Created by Nestor Pérez on 17/06/24.
//

import SwiftUI

struct HitmeButton: View {
  @State var isAlertVisible = false
  @Binding var sliderValue: Double
  @Binding var game: Game
  var body: some View {
    Button("Hit me".uppercased()) {
      isAlertVisible = true
    }.font(.title3)
      .bold()
      .padding(30.0)
      .overlay {
        RoundedRectangle(cornerRadius: 21.0).strokeBorder(Color.white, lineWidth: 3)
      }
      .background {
        Color("ButtonColor")
        LinearGradient(colors: [Color.white.opacity(0.3),Color.clear], startPoint: UnitPoint.top, endPoint: UnitPoint.bottom)
      }
      .foregroundColor(Color.white)
      .cornerRadius(21)
      .alert("Hello World!", isPresented: $isAlertVisible, actions: {
        Button("Awesome") {}
      }, message: {
        let roundedValue = Int(sliderValue.rounded())
        Text("""
            The slider's value is \(roundedValue)
            Your score is: \(game.points(sliderValue: roundedValue))
            """)
      })
  }
}

struct RoundedButton: View {
  var icon: String
  var body: some View {
    ZStack {
      Circle()
        .fill(Color.white)
        .strokeBorder(Color("ButtonBorderColor"), lineWidth: 2.0)
      Image(systemName: icon)
        .font(.title3)
        .foregroundColor(Color("ButtonForegroundColor"))
    }.frame(width: 56, height: 56)
  }
}

#Preview {
  VStack(spacing: 10) {
    HitmeButton(sliderValue: .constant(50.0), game: .constant(Game()))
    RoundedButton(icon: "list.dash")
    RoundedButton(icon: "arrow.counterclockwise")
  }
}
