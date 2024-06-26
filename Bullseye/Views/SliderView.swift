//
//  SliderView.swift
//  Bullseye
//
//  Created by Nestor Pérez on 17/06/24.
//

import SwiftUI

struct SliderView: View {
  @Binding var sliderValue: Double
  var body: some View {
    HStack {
      Text("0")
        .frame(width: 35)
        .foregroundColor(Color("TextColor"))
        .bold()
      Slider(value: $sliderValue, in: 0.0...100.0)
      Text("100")
        .frame(width: 35)
        .foregroundColor(Color("TextColor"))
        .bold()
    }
  }
}

#Preview {
  SliderView(sliderValue: .constant(50.0))
}
