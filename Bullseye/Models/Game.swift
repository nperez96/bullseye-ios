//
//  Game.swift
//  Bullseye
//
//  Created by Nestor Pérez on 15/06/24.
//

import Foundation


struct Game {
  var score: Int = 0
  var round: Int = 1
  var target: Int = Int.random(in: 0...100)
  var leaderboardEntries: [LeaderBoardEntry] = []
  
  func points(sliderValue: Double) -> Int {
    var points = 100 - abs(Int(sliderValue.rounded()) - target)
    if points > 95 && points < 100 {
      points += 50
    } else if points >= 100 {
      points += 100
    }
    return points
  }
  
  mutating func startNewRound(score: Int = 0) {
    round += 1
    self.score += score
    target = Int.random(in: 0...100)
    addNewRound(score: score)
  }
  
  mutating func restart() {
    round = 1
    score = 0
    target = Int.random(in: 0...100)
  }
  
  mutating private func addNewRound(score: Int) {
    leaderboardEntries.append(LeaderBoardEntry(score: score))
    leaderboardEntries.sort { $0.score > $1.score }
  }
}

struct LeaderBoardEntry {
  let score: Int
  let time: Date = Date()
}
