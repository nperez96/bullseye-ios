//
//  LeaderBoardView.swift
//  Bullseye
//
//  Created by Nestor Pérez on 27/08/24.
//

import SwiftUI

struct LeaderBoardView: View {
  @Binding var leaderboardEntries: [LeaderBoardEntry]
  var onCloseButtonClick: () -> Void
    var body: some View {
      ZStack {
        Color("AppBackground").ignoresSafeArea()
        VStack(spacing: 10) {
          LeaderboardHeaderView {
            onCloseButtonClick()
          }
          LeaderBoardTableHeaderView()
          ScrollView {
            VStack {
              ForEach(leaderboardEntries.indices, id: \.self) { index in
                let entry = leaderboardEntries[index]
                RowView(index: index + 1, score: entry.score, date: entry.time)
              }
            }
          }
        }.padding(10)
      }
    }
}

struct LeaderBoardTableHeaderView: View {
  var body: some View {
    ZStack {
      HStack {
        Text("Score".uppercased())
          .kerning(1.5)
          .font(.caption)
          .padding(EdgeInsets(top: CGFloat(0), leading: CGFloat(Constants.General.roundedViewLength), bottom: CGFloat(0), trailing: CGFloat(Constants.General.roundedViewLength)))
        Text("Time")
          .kerning(1.5)
          .font(.caption)
      }
    }
  }
}

struct LeaderboardHeaderView: View {
  @Environment(\.horizontalSizeClass) var horizontalSize
  @Environment(\.verticalSizeClass) var verticalSize
  var onCloseButtonClick: () -> Void
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
        RoundedButton(icon: "xmark", highContrast: true, action: {
          onCloseButtonClick()
        })
      }
    }.padding(.horizontal)
  }
}


#Preview {
  LeaderBoardView(leaderboardEntries: .constant([
    LeaderBoardEntry(score: 200),
    LeaderBoardEntry(score: 100),
    LeaderBoardEntry(score: 50),
    LeaderBoardEntry(score: 50),
    LeaderBoardEntry(score: 50),
    LeaderBoardEntry(score: 50),
  ]), onCloseButtonClick: {})
}
