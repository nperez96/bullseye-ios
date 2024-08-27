//
//  LeaderBoardView.swift
//  Bullseye
//
//  Created by Nestor Pérez on 27/08/24.
//

import SwiftUI

struct LeaderBoardView: View {
    var body: some View {
      ZStack {
        Color("AppBackground").ignoresSafeArea()
        VStack {
          LeaderboardHeaderView()
          LeaderBoardTableHeaderView()
          RowView(index: .constant(1), score: .constant(20), date: .constant(Date()))
        }.padding(10)
      }
    }
}

struct LeaderBoardTableHeaderView: View {
  var body: some View {
    ZStack {
      HStack {
        Text("Score")
          .padding(EdgeInsets(top: CGFloat(0), leading: CGFloat(Constants.General.roundedViewLength), bottom: CGFloat(0), trailing: CGFloat(Constants.General.roundedViewLength)))
        Text("Time")
      }
    }
  }
}

struct LeaderboardHeaderView: View {
  @Environment(\.horizontalSizeClass) var horizontalSize
  @Environment(\.verticalSizeClass) var verticalSize
  var body: some View {
    ZStack {
      HStack {
        LeaderBoardTitle(text: "Leaderboard")
        if horizontalSize == .compact && verticalSize == .regular {
          Spacer()
        }
      }
      HStack {
        Spacer()
        RoundedButton(icon: "xmark", highContrast: true)
      }
    }.padding(.horizontal)
  }
}

#Preview {
    LeaderBoardView()
}
