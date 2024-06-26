//
//  BullseyeTests.swift
//  BullseyeTests
//
//  Created by Nestor Pérez on 15/06/24.
//

import XCTest
@testable import Bullseye

final class BullseyeTests: XCTestCase {
  var game: Game!
  
  override func setUpWithError() throws {
    game = Game()
  }
  
  override func tearDownWithError() throws {
    game = nil
  }
  
  func testScorePositive() {
    let guess = game.target + 5
    let score = game.points(sliderValue: Double(guess))
    XCTAssertEqual(score, 95)
  }
  
  func testScoreNegative() {
    let guess = game.target - 5
    let score = game.points(sliderValue: Double(guess))
    XCTAssertEqual(score, 95)
  }
  
  func testPerfectScore() {
    let guess = game.target
    let score = game.points(sliderValue: Double(guess))
    XCTAssertEqual(score, 200)
  }
  
  func testCloseScore() {
    let guess = game.target - 2
    let score = game.points(sliderValue: Double(guess))
    XCTAssertEqual(score, 98 + 50)
  }
  
  func testStartNewRound() {
    game.startNewRound()
    XCTAssertEqual(game.round, 2)
  }
  
  func testShouldPreserveScoreUponRestart() {
    game.startNewRound(score: 100)
    XCTAssertEqual(game.score, 100)
  }
  
  func testShouldPreserveScoreUponManyRestarts() {
    game.startNewRound(score: 100)
    game.startNewRound(score: 200)
    XCTAssertEqual(game.score, 300)
  }
  
  func testRestart() {
    game.startNewRound(score: 100)
    XCTAssertNotEqual(game.score, 0)
    XCTAssertNotEqual(game.round, 1)
    game.restart()
    XCTAssertEqual(game.score, 0)
    XCTAssertEqual(game.round, 1)
  }
}
