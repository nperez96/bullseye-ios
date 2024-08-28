//
//  RowView.swift
//  Bullseye
//
//  Created by Nestor Pérez on 23/08/24.
//

import SwiftUI

struct RowView: View {
  var index: Int
  var score: Int
  var date: Date
  var body: some View {
    HStack {
      RoundedTextView(index: index)
        .padding(EdgeInsets(top: CGFloat(0), leading: CGFloat(0), bottom: CGFloat(0), trailing: CGFloat(Constants.General.roundedViewLength)))
      ScoreText(score: score)
        .padding(EdgeInsets(top: CGFloat(0), leading: CGFloat(0), bottom: CGFloat(0), trailing: CGFloat(Constants.General.roundedViewLength)))
      DateText(date: date)
        .padding()
    }
    .frame(height: Constants.General.roundedRectViewHeight)
    .overlay(
      RoundedRectangle(cornerRadius: Constants.General.roundedRectViewHeight).stroke(Color("RowViewStrokeColor"), lineWidth: Constants.General.strokeWidth)
    )
  }
}

private struct RoundedTextView: View {
  var index: Int
  var body: some View {
    Text(String(index))
      .bold()
      .frame(
        width: Constants.General.roundedRectViewHeight,
        height: Constants.General.roundedRectViewHeight
      )
      .overlay(
        RoundedRectangle(cornerRadius: Constants.General.roundedRectViewHeight).stroke(Color("RowViewStrokeColor"), lineWidth: Constants.General.strokeWidth)
      )
  }
}

private struct ScoreText: View {
  var score: Int
  var body: some View {
    Text(String(score))
      .bold()
  }
}

private struct DateText: View {
  var date: Date
  var body: some View {
    Text(date.formatted(date: .omitted, time: .shortened))
      .bold()
  }
}

#Preview {
  RowView(index: 1, score: 10, date: Date()).padding(10)
}
