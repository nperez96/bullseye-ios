//
//  Buttons.swift
//  Bullseye
//
//  Created by Nestor Pérez on 17/06/24.
//

import SwiftUI

struct HitmeButton: View {
  @State var isAlertVisible = false
  @State var alertMessage: String? = nil
  var onButtonClick: () -> Void
  var body: some View {
    Button("Hit me".uppercased()) {
      onButtonClick()
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
  }
}

struct RoundedButton: View {
  var icon: String
  var action: (() -> Void)? = nil
  var body: some View {
    Button(action: {
      action?()
    }, label: {
      ZStack {
        Circle()
          .fill(Color("ButtonBackgroundColor"))
          .strokeBorder(Color("ButtonBorderColor"), lineWidth: 2.0)
        Image(systemName: icon)
          .font(.title3)
          .foregroundColor(Color("ButtonForegroundColor"))
      }.frame(width: 56, height: 56)
    })
  }
}

struct StaticRectangleLabeledButton: View {
  var labelText: String
  var score: Int
  var action: (() -> Void)? = nil
  var body: some View {
    Button(action: {
      action?()
    }, label: {
      VStack {
        Text(labelText.uppercased())
          .font(.caption)
          .kerning(1.5)
          .foregroundStyle(Color("TextColor"))
        Text(String(score))
          .kerning(-0.2)
          .font(.title3)
          .frame(width: 68, height: 56)
          .foregroundStyle(Color("TextColor"))
          .overlay {
            RoundedRectangle(cornerRadius: 21.0)
              .stroke(Color("ButtonBorderColor"), lineWidth: 2.0)
          }
      }
    })
  }
}

#Preview {
  VStack(spacing: 10) {
    HitmeButton {}
    RoundedButton(icon: "list.dash")
    RoundedButton(icon: "arrow.counterclockwise")
    StaticRectangleLabeledButton(labelText: "Score", score: 999)
  }
}
