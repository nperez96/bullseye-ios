//
//  RowView.swift
//  Bullseye
//
//  Created by Nestor Pérez on 23/08/24.
//

import SwiftUI

struct RowView: View {
  @Binding var index: Int
  @Binding var score: Int
  @Binding var date: Date
  var body: some View {
    HStack {
      RoundedTextView(index: $index)
        .padding(EdgeInsets(top: CGFloat(0), leading: CGFloat(0), bottom: CGFloat(0), trailing: CGFloat(Constants.General.roundedViewLength)))
      ScoreText(score: $score)
        .padding(EdgeInsets(top: CGFloat(0), leading: CGFloat(0), bottom: CGFloat(0), trailing: CGFloat(Constants.General.roundedViewLength)))
      DateText(date: $date)
        .padding()
    }
    .frame(height: Constants.General.roundedRectViewHeight)
    .overlay(
      RoundedRectangle(cornerRadius: Constants.General.roundedRectViewHeight).stroke(Color("RowViewStrokeColor"), lineWidth: Constants.General.strokeWidth)
    )
  }
}

private struct RoundedTextView: View {
  @Binding var index: Int
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
  @Binding var score: Int
  var body: some View {
    Text(String(score))
      .bold()
  }
}

private struct DateText: View {
  @Binding var date: Date
  var body: some View {
    Text("12:31 PM")
      .bold()
  }
}

#Preview {
  RowView(index: .constant(1), score: .constant(10), date: .constant(Date())).padding(10)
}
